<?php
/**
 * Dieser View zeigt das Formular an, in dem der Administrator vor dem
 * Versenden eines Newsletters den Absender auswaehlen kann.
 * @author Stefan Rank-Kunitz at Open-Letters anno 2009 nach Vorlage von Sebastian de Vries
 * @package Newslettersystem
 * @subpackage Backend
 */

if(!defined('ROOT_PATH')){
    die('You cannot access this file directly!');
}

?>
	<h2>i18n(newsletter_send_headline)</h2>
	<p>i18n(newsletter_send_headline_01)
	<?php if( DEBUG_MODUS>0) echo " (DEBUG-MODUS)"; ?></p>
<?php
	echo "<form method='get' action='".basename($_SERVER['PHP_SELF'])."'>\n";
		echo "<div>\n";
			echo("<input type='hidden' name='page' value='".$_GET['page']."'>\n");
			echo("<input type='hidden' name='sendNewsletter' value='".$_GET['sendNewsletter']."'>\n");
			echo("<input type='hidden' name='sendNewsletterConfirm' value='1'>\n");


			echo("<br /><br />");
			echo("<input style='float:right; color: #fff; background-color: #f00;' type='submit' value='i18n(newsletter_send_button)' />\n");
			echo("&nbsp;&nbsp;&nbsp;&nbsp;");
			echo("<a href='".basename($_SERVER['PHP_SELF'])."?page=".$_GET['page']."'>i18n(newsletter_send_abort)</a>\n");
		echo "</div>\n";
	echo("</form>\n");
