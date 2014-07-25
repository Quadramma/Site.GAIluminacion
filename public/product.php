<?php
include "views/head.php"
?>
<body>
<!-- PRELOAD Y HEADER ------------------------------------------ -->
<img id="preloader" src="images/preloader.gif" alt="" />
<div class="preloader_hide">
    <div id="page">
        <?php include "views/external_forms.php" ?>	
        <?php include "views/external_navbar.php" ?>
        <?php include "views/product_body.php" ?>
    </div>
    <!-- FOOTER -->
    <footer>
        <?php include "views/external_contact.php" ?>
    </footer>
</div>
<!-- PRELOAD Y HEADER  END ------------------- -->
</body>
</html>
