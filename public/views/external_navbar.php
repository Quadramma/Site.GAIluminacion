<header>
    <div class="menu_block">
        <div class="container clearfix">
            <div class="logo pull-left">
                <img src="images/logoGA.png">
            </div>
            <div class="pull-right">
                <nav class="navmenu center">
                    <ul>
                        <li class="liHome first  scroll_btn"><a  rel="home" href="../home">Home</a>
                        </li>
                        <li class="liColl <?php echo ($productid != null)?"active":"" ?> scroll_btn"><a rel="collection" href="../coleccion">Colección</a>
                        </li>
                        <li class="liProy <?php echo ($projectid != null)?"active":"" ?> scroll_btn"><a rel="collection" href="../proyectos">Proyectos</a>
                        </li>
                        <li class="liFil scroll_btn"><a rel="filosofia" href="../filosofia">Filosofía</a>
                        </li>
                        <li class="liLoc scroll_btn last"><a rel="locales" href="../locales">Locales</a>
                        </li>
                        <li class="liCont scroll_btn last"><a ng-click="pushState('contacto')"  rel="contacto" href="#contacto">Contacto</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- //MENU -->
        </div>
        <!-- //MENU BLOCK -->
    </div>
    <!-- //CONTAINER -->
</header>
<!-- //HEADER -->