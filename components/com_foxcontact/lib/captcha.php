<?php defined('_JEXEC') or die('Restricted access');
/*
This file is part of "Fox Joomla Extensions".

You can redistribute it and/or modify it under the terms of the GNU General Public License
GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html

You have the freedom:
* to use this software for both commercial and non-commercial purposes
* to share, copy, distribute and install this software and charge for it if you wish.
Under the following conditions:
* You must attribute the work to the original author by leaving untouched the link "powered by",
except if you obtain a "registerd version" http://www.fox.ra.it/forum/14-licensing/151-remove-the-backlink-powered-by-fox-contact.html

Author: Demis Palma
Documentation at http://www.fox.ra.it/forum/2-documentation.html
*/

require_once JPATH_COMPONENT . "/helpers/fsession.php";
require_once JPATH_COMPONENT . "/helpers/flogger.php";


require_once "loader.php";

class captchaLoader extends Loader
{
	protected function type()
	{
		return "captcha";
	}

	protected function http_headers()
	{
	}

	protected function content_header()
	{
	}

	protected function content_footer()
	{
	}

	protected function load()
	{
		switch ($this->Params->get("stdcaptchatype", ""))
		{
			case 1:
				$captcha = new FMathCaptchaDrawer($this->Params);
				break;

			default:
				$captcha = new FStandardCaptchaDrawer($this->Params);
		}

		$captcha->Shuffle();
		$captcha->Draw();
	}

}



abstract class FCaptchaDrawer
{
	protected $Params;
	protected $Charset;
	protected $Question;
	protected $Answer;
	protected $Image = array();
	protected $Font = array();
	protected $Background = array();
	protected $Colors = array();
	protected $DebugLog;

	abstract public function Shuffle();


	public function __construct(&$params)
	{
		$this->DebugLog = new FDebugLogger("Captcha Drawer");
		$this->Params = $params;
		$this->LoadParams();
		$this->DebugLog->Write("Font: " . print_r($this->Font, true));
	}


	public function Draw()
	{
		$jsession = JFactory::getSession();
		$cid = $mid = 0;
		switch (JRequest::getVar("owner", NULL, "GET"))
		{
			case "component":
				$cid = JRequest::getVar("id", NULL, "GET");
				break;
			case "module":
				$mid = JRequest::getVar("id", NULL, "GET");
		}
		$fsession = new FSession($jsession->getId(), $cid, $mid);

		// Store the answer in the session
		if ($fsession->Save($this->Answer, "captcha_answer"))
			$this->DebugLog->Write("Answer saved into session");
		else
			$this->DebugLog->Write("Database query failed");


		// White background
		imagefill($this->Image['data'], 0, 0, $this->Colors['Background']);

		// Background grid
		$this->DrawGrid();

		$len = strlen($this->Question);
		// Space available for one single char. It is based on image width and number of characters to display
		$space = $this->Image['width'] / $len;

		// Single disturb characters rendering. Doubles the characters and halves the space
		for ($p = 0; $p < 2 * $len; ++$p)
		{
			// render a random character from ascii 33 and ascii 126
			$this->Render(chr(rand(33, 126)), $p, $space / 2, $this->Colors['Disturb']);
		}

		// Single characters rendering
		for ($p = 0; $p < $len; ++$p)
		{
			$this->Render($this->Question[$p], $p, $space, $this->Colors['Text']);
		}

		$this->DebugLog->Write("Render done");

		// Debug with &noimage=1
		if (JRequest::getVar("noimage", NULL, 'GET')) return;

		// Prepare some useful headers
		header("Expires: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		// must not be cached by the client browser or any proxy
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");
		header("Content-type:image/jpeg");
		header("Content-Disposition:inline ; filename=fcaptcha.jpg");
		// Send the stream to the client browser
		imagejpeg($this->Image['data']);
		imagedestroy($this->Image['data']);

		$this->DebugLog->Write("Image sent to client");
	}


	private function Render($character, $position, $space, $color)
	{
		imagettftext(
		$this->Image['data'],
		rand($this->Font['min'], $this->Font['max']),
		rand( -$this->Font['angle'], $this->Font['angle']),
		rand($position * $space + $this->Font['min'], (($position + 1 ) * $space) - $this->Font['max']),
		rand($this->Font['max'], $this->Image['height'] - $this->Font['max']),
		$color,
		$this->Font['family'],
		$character);
	}


	private function validate_hex_color($color)
	{
		return
		strlen($color) == 7 &&
		preg_match('/#[0-9a-fA-F]{6}/', $color) == 1;
	}


	private function LoadColor($key, $default)
	{
		$color = $this->Params->get($key, $default);
		if (!$this->validate_hex_color($color)) $color = $default;
		return sscanf($color, '#%2x%2x%2x');
	}


	private function LoadParams()
	{
		// Load font
		$this->Font['min'] = $this->Params->get("stdcaptchafontmin", "14");
		$this->Font['max'] = $this->Params->get("stdcaptchafontmax", "20");
		$this->Font['angle'] = $this->Params->get("stdcaptchaangle", "20");

		$fontdir = JPATH_SITE . "/media/" . $GLOBALS["com_name"] . "/fonts/";
		$fontname = $this->Params->get("stdcaptchafont", "-1");
		// "-1" means no selection.
		if ($fontname == "-1")
		{
			// Choose a random font
			jimport("joomla.filesystem.folder");
			$fonts = JFolder::files($fontdir, '\.ttf$');
			$fontname = $fonts[rand(0, count($fonts) - 1)];
		}
		$this->Font['family'] = $fontdir . $fontname;

		// Load image parameters
		$this->Image['width'] = $this->Params->get("stdcaptchawidth", "150");
		$this->Image['height'] = $this->Params->get("stdcaptchaheight", "75");
		// Create image
		$this->Image['data'] = imagecreate($this->Image['width'], $this->Image['height']);
		// Create colors

		//$this->Colors['Background'] = imagecolorallocate($this->Image['data'], 255, 255, 255);
		//$this->Colors['Text'] = imagecolorallocate($this->Image['data'], rand(0, 50), rand(0, 50), rand(0, 50));  // Average value: 25
		//$this->Colors['Disturb'] = imagecolorallocate($this->Image['data'], rand(180, 220), rand(180, 220), rand(180, 220));  // average value: 200

		$background = $this->LoadColor("stdcaptcha_backgroundcolor", "#ffffff");
		$this->Colors['Background'] = imagecolorallocate($this->Image['data'], $background[0], $background[1], $background[2]);

		$text = $this->LoadColor("stdcaptcha_textcolor", "#191919");
		$this->Colors['Text'] = imagecolorallocate($this->Image['data'], $text[0], $text[1], $text[2]);

		$disturb = $this->LoadColor("stdcaptcha_disturbcolor", "#c8c8c8");
		$this->Colors['Disturb'] = imagecolorallocate($this->Image['data'], $disturb[0], $disturb[1], $disturb[2]);
	}

}


class FMathCaptchaDrawer extends FCaptchaDrawer
{
	public function __construct(&$params)
	{
		parent::__construct($params);
		// We need 2 random numbers and one operator between them
		$this->Charset = "+-*";  // Operators
	}


	public function Shuffle()
	{
		// To avoid negative results, the second number is lower than the first
		$this->Question = rand(6, 11) . substr(str_shuffle($this->Charset), 0, 1) . rand(1, 5);  // Question as a string
		// Find the result and store it on $result
		eval("\$this->Answer = strval(" . $this->Question . ");");  // Answer as a string
	}

	protected function DrawGrid()
	{
		$gridsize = intval(($this->Font['min'] + $this->Font['max']) / 2);
		// Vertical lines
		for ($x = $gridsize; $x < $this->Image['width']; $x += $gridsize)
		{
			imageline($this->Image['data'], $x, 0, $x, $this->Image['height'], $this->Colors['Disturb']);
		}
		// Horizintal lines
		for ($y = $gridsize; $y < $this->Image['height']; $y += $gridsize)
		{
			imageline($this->Image['data'], 0, $y, $this->Image['width'], $y, $this->Colors['Disturb']);
		}
	}

}


class FStandardCaptchaDrawer extends FCaptchaDrawer
{
	public function __construct(&$params)
	{
		parent::__construct($params);
		// Define charset. No need to removes some similar chars due to FCaptcha::FaultTolerance()
		// I 1 l, O o 0, g q 9, these depends on font: (S s 5, B 8, G 6)
		//$this->Charset = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefhijkmnprstuvwxyz2345678";
		$this->Charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
	}

	public function Shuffle()
	{
		$length = $this->Params->get("stdcaptcha_length", 5);  // Read the length in characters
		$this->Question = $this->Answer = substr(str_shuffle($this->Charset), 0, $length);
	}

	protected function DrawGrid()
	{
		// Do intentionally nothing.
	}

}
