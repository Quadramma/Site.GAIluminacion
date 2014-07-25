<?php include "views/head.php" ?>
<body>
<!-- PRELOAD Y HEADER ------------------------------------------ -->
<!--
<img id="preloader" src="images/preloader.gif" alt="" />
-->
<img id="preloader" src="images/preloader_ga.gif" alt="" />
<div class="preloader_hide">
    <div id="page">
        <?php include "views/forms.php" ?>
        <?php include "views/navbar.php" ?>
        <?php include "views/home.php" ?>
        <?php include "views/about.php" ?>
        <?php include "views/collection.php" ?>
        <?php include "views/projects.php" ?>
        <?php include "views/filosofy.php" ?>
        <div style="background-color:white;height:25px;"></div>
        <?php include "views/locals.php" ?>
    </div>
    <!-- FOOTER -->
    <footer>
        <?php include "views/contact.php" ?>
    </footer>
</div>
<!-- PRELOAD Y HEADER  END ------------------- -->
</body>
</html>
