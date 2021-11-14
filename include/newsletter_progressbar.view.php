<?php
/**
 * Dieser View initialiesiert die Progressbar (Fortschrittsbalken) beim Versand
 * der Newsletter.
 * @author Stefan Rank-Kunitz at Open-Letters
 * @package Newslettersystem
 * @subpackage Backend
 */

if(!defined('ROOT_PATH')){
    die('You cannot access this file directly!');
}
?>

    <style type="text/css">
        .ui-progressbar-value { background-image: url(<?php echo ROOT_PATH; ?>images/pbar-ani.gif);}
    </style>
    <script type="text/javascript">
        jQuery(function() {
            jQuery("#progressbar").progressbar({
                value:<?php echo $params['percentage'];?> 
            });
        });
    </script>
