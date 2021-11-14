<?php
/**
 * Diese Datei enthaelt den View, der dem Administrator das Hochladen einer
 * Adressdatei zum Newslettersystem ermoeglicht.
 * @author Bernd Krüger-Knauber anno 2012
 * @package Newslettersystem
 * @subpackage Backend
 */

if(!defined('ROOT_PATH')){
    die('You cannot access this file directly!');
}

echo( "<form enctype=\"multipart/form-data\" action=\"".basename($_SERVER['PHP_SELF'])."?page=usermanagement&amp;uploadit\" method=\"post\">\n");
?>
<h2>i18n(newsletter_upload_form_headline_admin)</h2>
<div style="margin: 10px 5px; color: blue;">i18n(newsletter_subscribe_form_notice_admin)</div>
<div style="margin: 10px 5px;">i18n(newsletter_upload_format_info)</div>
<div style="margin-bottom: 20px;">
    <input type="hidden" name="uploadit" value="1" />
    <?php echo( "<input type=\"hidden\" name=\"page\" value=\"".$_GET['page']."\" />\n" ); ?>
    <table border="0" cellspacing="4" cellpadding="0" summary="Empfänger hinzufügen">
        <tr>
            <td>i18n(newsletter_upload_form_file_admin)</td>
            <td><input name="uploadedfile" type="file" size="40" /></td>
        </tr><tr>
            <td>i18n(newsletter_upload_form_optinconfirm_admin)</td>
            <td><input type="radio" id="yes" name="DoubleOptIn" value="1" checked="checked">
                <label for="yes">i18n(yes)</label><br>
                <input type="radio" id="no" name="DoubleOptIn" value="0">
                <label for="no">i18n(no)</label><br>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit" name="action" value="Upload">i18n(newsletter_upload_form_uploadbutton_admin)</button>
            </td>
        </tr>
    </table>
</div>
</form>
