-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-06-2014 a las 13:10:25
-- Versión del servidor: 5.5.37
-- Versión de PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `f7000115_gaweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ga_category`
--

CREATE TABLE IF NOT EXISTS `ga_category` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `_category_type_id` int(11) NOT NULL DEFAULT '1',
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Volcado de datos para la tabla `ga_category`
--

INSERT INTO `ga_category` (`_id`, `_category_type_id`, `description`) VALUES
(1, 1, 'Cristal de Bohemia'),
(2, 1, 'Colgantes'),
(8, 1, 'LED - Luminarias'),
(31, 2, 'Residenciales'),
(32, 2, 'Comerciales'),
(40, 1, 'LED - Lámparas'),
(49, 1, 'Plafones'),
(47, 1, 'LED'),
(50, 1, 'Pared'),
(51, 1, 'Exterior & Jardin'),
(52, 1, 'AMERI DESIGN'),
(53, 1, 'Cuadros y Esculturas'),
(54, 1, 'Lamp. de Pie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ga_category_type`
--

CREATE TABLE IF NOT EXISTS `ga_category_type` (
  `_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ga_category_type`
--

INSERT INTO `ga_category_type` (`_id`, `description`) VALUES
(1, 'Producto'),
(2, 'Proyecto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ga_product`
--

CREATE TABLE IF NOT EXISTS `ga_product` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `_category_id` int(11) NOT NULL,
  `description` text,
  `url` text NOT NULL,
  `specification` text NOT NULL,
  `slider_urls` varchar(500) NOT NULL,
  `details1` text NOT NULL,
  `details2` text NOT NULL,
  `details3` text NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `_category_id` (`_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

--
-- Volcado de datos para la tabla `ga_product`
--

INSERT INTO `ga_product` (`_id`, `code`, `name`, `_category_id`, `description`, `url`, `specification`, `slider_urls`, `details1`, `details2`, `details3`) VALUES
(125, '17-640186', 'Da Vinci', 1, 'Da Vinci es la creación de un artista. Totalmente fabricada con Cristal de Bohemia, importado de República Checa. Brazos formados manualmente. Piezas de terminación tipo cónica tayada a mano. Genera un efecto de iluminación difuso. Apto para dimmer. Regulable en altura por cadena cromada reforzada. (Consulte por servicio de instalación especializado).', 'Da Vinci 40L foto.jpg', '<b>AspectsTitle<b>Aspects Aspects Aspects<br/>AspectsAspectsAspects', 'Slider-Da Vinci 40l 1.jpg$$Slider-Da Vinci 40l 2.jpg$$Da Vinci 40 luces_slider.jpg', 'Diámetro 100cm. Altura 85cm.', '40 luces tipo G9 40w máx. 220v.', 'Cristal de Bohemia transparente.'),
(203, '27-915003980601', 'Cielo by Philips', 8, '"Cielo" by Philips es un colgante que conserva un secreto en su interior y hace lo imposible, posible: emite iluminación sin necesidad de la fuente de luz a la vista. Genera un efecto visual sin fondo, totalmente confortable y parejo. Ahora podés cuidar al planeta, iluminar y decorar tu ambiente con un mismo diseño.', 'Cielo colgante Philips_blanco.jpg', 'Ancho: 35cm', 'SLIDE Cielo colgante Philips_blanco.jpg$$SLIDE Cielo colgante Philips_X3.jpg$$SLIDE 2 Cielo colgante Philips_blanco.jpg', 'Diámetro 58cm. Altura regulable.', 'LED 24x 2,5w=60w. Luz cálida.', 'Blanco, negro y oro. Interior blanco satinado.'),
(206, '2-5745', 'Rosa Andaluse', 52, 'Fino colgante construido en bronce con baño cromo brillante. Producido en Italia con Cristales Swarovski. Incluye certificado de autenticidad. Ideal comedor principal, habitación y living. Vea también apliques de pared, lámpara de mesa y velador de la misma colección.', 'Albani_Rosa Andalusa_colgante_productos.jpg', '', 'Slider-Rose Andaluse 2.jpg$$Slider-Rose Andaluse 3.jpg$$Slider-Rose Andaluse 1.jpg', 'Diametro 80cm x h:80cm.', '8 luces G9 60w 220v. Apto para dimmer.', 'Cromo brillante con cristales Swarovski multicolor.'),
(207, '23/1-00-0001-BW', 'CIRC', 8, 'Colgante ultra minimalista, de diseño puro y simple. Ideal para instalar sobre una mesa de comedor ó en el centro de un ambiente. Genera un efecto de iluminación difuso mediante el acrílico satinado de alta resistencia. Es regulable en altura. No acepta dimmer.', 'Circ Lumar.jpg', '', 'Circ Lumar_slider 3.jpg$$Circ Lumar_slider.jpg$$Circ Lumar_slider 2.jpg', 'Diámetro 60cm. Regulable en altural', 'LED 22w. Lúz cálida 3000°K.', 'Color blanco mate con difusor circular de acrílico satinado alta resistencia (PMMA).'),
(208, '27-915003980701', 'ARTUS by Philips', 49, 'Plafón circular moderno con doble efecto de iluminación manejado por control remoto. En el centro funciona un tubo de 22w circular de bajo consumo que genera un efecto de iluminación difusor, igual para centro de ambientes, living y/o habitación. En la periferia se encuentra instalado un sistema LED RGB (Red, Green and blue) el cual permite se encendido de forma separada, con cambio de color constante o fijo, para generar un ambiente íntimo y personalizado. Garantía de fábrica Philips: 1 año.', 'Artus plafon_Philips.jpg', '', 'SLIDE plafon Artus 1.jpg$$SLIDE plafon Artus 2.jpg$$SLIDE plafon Artus 1.jpg', 'Diámetro 50cm. h:11,5cm.', 'Tubo circular 22w + Sistema LED RGB c/control remoto.', 'Vidrio opal'),
(209, '27-915002822101', 'Luciano by Philips', 8, 'Sistema colgante Luciano by Philips. Reune el diseño moderno y la última tecnología. Utiliza LED´s de alta potencia los cuales brindan un efecto dirigido con un tono de luz agradable, similar a las lámparas halógenas. Los discos que contienen las lámparas son dirigibles. No acepta dimmer.', 'luciano.jpg', '', 'SLIDE Colg Luciano 3.jpg$$SLIDE Colg Luciano 2.jpg$$SLIDE Colg Luciano 1.jpg', 'Largo 97,6cm. Ancho 19,4cm. Altura regulable', 'LED Philips 4 x 7,5w. Luz cálida 3000°K.', 'Cromado brillante.'),
(210, '23/1-00-0003-BW', 'NET', 8, 'Colgante ultra-chato de diseño minimalista con sistema de LED 44w. Genera una iluminación potente y difusa, ideal para suspender sobre mesas. Es regulable en altura. No dimmable. Diseño español de primera calidad.', 'Net Lumar.jpg', '', 'SLIDE Colg NET 3.jpg$$SLIDE Colg NET 2.jpg$$SLIDE Colg NET 1.jpg', 'Diámetro 57,5cm. Regulable en altura', 'LED 44w. Lúz cálida 3000°K.', 'Blanco mate. Difusor satinado.'),
(211, '27-915002250601', 'Ledino by Philips', 8, 'Plafón moderno cuadrado con bordes redondeados, construido integralmente en aluminio. Los cabezales contienen un módulo de LED especialmente diseñado por Philips. Estos mismo son dirigbles y rotables en 360°. Efecto de luz dirigible, ideal para living y habitación 4x4m. máx. No dimmable. Garantía Philips de 1 año.', 'Ledino 4 LED plafonl Philips_oro.jpg', '', 'SLIDE Plafon Ledino cuadrado 4L 3.jpg$$SLIDE Plafon Ledino cuadrado 4L 1.jpg$$SLIDE Plafon Ledino cuadrado 4L 2.jpg', '28,4 x 28,4cm. Saliente 7,7cm.', 'LED 4 x 7,5w. Lúz cálida 3100°K', 'Blanco mate. Parte trasera cabezal negro mate.'),
(212, '23/1-05-4415-78', 'Supple', 8, 'Aplique de pared con brazo flexible para lectura, con sistema de iluminación LED de alta potencia, ideal para el costado de la cama o escritorio. Luz dirigida. Angulo de lúz 140°. Diseño español de primera calidad.', 'Supply Lumar.jpg', '', 'Supply Lumar_2.jpg$$Supply Lumar_2.jpg$$Supply Lumar_2.jpg', 'Base diámetro 11,6cm. Saliente brazo 37cm.', 'LED 4,5w. Lúz cálida 3000°K.', 'Blanco mate + Policarbonato transparente'),
(213, '21/1-CL0003', 'LED 10x3w', 8, 'Colgante ultra-chato de diseño minimalista. Tecnología LED con un consumo total de 30w. Vida útil 30.000hs. No dimmable. Efecto de iluminación difuso, ideal para mesa de comedor o para el centro de su ambiente. Disponible en otros tamaños (consultar).', 'CL003_LUCCIOLA_2.jpg', '', 'Slider-Collg CL003.jpg$$Slider-Collg CL003 1.jpg$$Slider-Collg CL003 2.jpg', 'Diámetro 60cm. Regulable en altura', 'LED 10x3w. Lúz cálida 3000°K', 'Acrílico traslúcido circular. Base cromo brillante.'),
(214, '2-5813', 'Piastra', 52, 'Aplique de pared fabricado artesanalmente en Italia bajo la técnica "Piastra". En el centro podemos apreciar la pieza principal en color ambar arenado. El borde se aplica luego como un hilo de cristal. Todos los procesos son realizamos a mano uno por uno. Genera un efecto de iluminación difusa. Apto para colocar dimmer.', 'Piastra aplique pared.jpg', '', 'Slider-Piastra 1.jpg$$Slider-Piastra 3.jpg$$Slider-Piastra 2.jpg', 'Ancho 35cm. Alto 30cm. Saliente 12cm.', '1 x E27 100w máx. Rosca clásica.', 'Cristal de murano ambar. Sujeción metal cromado'),
(215, '23/1-25-2580-AH', 'Arc', 54, 'Lámpara de pie ARC, diseñados en España por GROK. Efecto difuso, luz indirecta. Potencia hasta 300w con regulador de intensidad.', 'Thumb_arc.jpg', '', 'SLIDE ARC pie 1.jpg$$SLIDE ARC pie 2.jpg$$SLIDE ARC pie 3.jpg', 'h: 190cm x 21cm', 'Cuarzo R7S 118mm 300w máx.', 'Gris aluminio anodizado / Negro'),
(216, '15-ME-LP', 'HOPE', 54, 'Lámpara de pie de diseño moderno, conformada por múltiples capas de acrílico prismático. Generar un efecto visual impactante. Se recomienda para espacios amplios por su diámetro. Efecto de iluminación difusa.', 'Thumb_Hope.jpg', '', 'SLIDE Medusa 1.jpg$$SLIDE Medusa 2.jpg$$SLIDE Medusa 3.jpg', 'h 195cm x diámetro 70cm', '1 x E27 100w máx. Rosca clásica', 'Acrílico prismático de alta calidad. Base cromo.'),
(217, '23/1-25-2726', 'Umbrella', 54, 'Lámpara de pie con base de diseño enroscado. Apoyo innovador que esta unida a la parte central que sostiene la campana de 450mm de diámetro. La misma esta construida en acrílico de alta calidad. El interior se encuentra revestido por un material corrugado que aporta un detalle distintivo a este modelo. El efecto de iluminación es dirigida hacia abajo, por lo cual genera una atmósfera de intimidad.', 'Thumb_UMBRELLA.jpg', '', 'SLIDE umbrella 1.jpg$$SLIDE umbrella 2.jpg$$SLIDE umbrella 3.jpg', 'h 1595mm x diámetro 450mm', '3 x E14 11w bajo consumo. Rosca mignon.', 'Exterior negro e interior oro ó exterior blanco e interior gris.'),
(218, '23/1-25-4339-21', 'Virginia', 54, 'Lámpara de pie moderna y funcional. De diseño compacto, regulable en altura, apta para ambientes reducidos. La pantalla de color negro es la original, pero existe la posibilidad de intercambiarla por otro color/tela (Consulte a su vendedor). Dentro de la pantalla se pueden colocar 3 lámpara tipo bajo consumo rosca E27 de 21w c/u. Suficiente iluminación para ser una buena lámpara de lectura. Dispone de una tapa de acrílico en la parte supercior de la pantalla para generar un efecto difuso sobre las paredes.', 'Thumb_virginia.jpg', '', 'SLIDE virginia 1.jpg$$SLIDE virginia 3.jpg$$SLIDE virginia 1.jpg', 'h 1700mm x Diámetro 450mm', '3 x E27 21w bajo consumo. Rosca clásica', 'Base en gris grafito, barral central cromado con regulación de altura. Pantalla negra con borde cromo superior.'),
(219, '23/1-25-0264', 'Magma', 54, 'Lámpara de pie de diseño informal y funcional. Regulable en altura. En la base se encuentran 4 ruedas que permiten su fácil desplazamiento y que aportan un extra el diseño. La pantalla esta construida con cintas generando un efecto desparejo y muy cool. La misma se puede pivotear para acomodarla a su gusto. Efecto de iluminación difuso.', 'Thumb_MAGMA.jpg', '', 'SLIDE magma 1.jpg$$SLIDE magma 2.jpg$$SLIDE magma 3.jpg', 'h mínima 1315mm. Máxima 1675mm x Diámetro 350mm', '1 x E27 30w bajo consumo. Rosca clásica.', 'Base color gris grafito. Parte central gris grafito combinada con cromo. Pantalla de cintas en color negro o blanco.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ga_project`
--

CREATE TABLE IF NOT EXISTS `ga_project` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `_category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(100) NOT NULL,
  `slider_urls` varchar(500) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `ga_project`
--

INSERT INTO `ga_project` (`_id`, `_category_id`, `name`, `description`, `url`, `slider_urls`) VALUES
(1, 31, 'Proyecto 12', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."', 'proyecto1.jpg', 'proyecto1.jpg$$proyecto1.jpg$$proyecto1.jpg'),
(2, 31, 'Proyecto 2', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."', 'project_image_default.jpg', 'proyecto2.jpg$$placeholder.png$$placeholder.png'),
(3, 31, 'Proyecto 3', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."', 'project_image_default.jpg', 'placeholder.png$$placeholder.png$$placeholder.png'),
(4, 32, 'Proyecto 4', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'project_default_5.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(7, 32, 'Proyecto 5', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'project_default_6.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(8, 32, 'Proyecto 6', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_default_7.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(9, 31, 'Proyecto 7', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_image_default.jpg', 'placeholder.png$$placeholder.png$$placeholder.png'),
(10, 32, 'Proyecto 8', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_default_8.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(11, 31, 'Proyecto 9', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_default_1.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(12, 31, 'Proyecto 10', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_default_2.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(13, 31, 'Proyecto 11', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_default_3.png', 'placeholder.png$$placeholder.png$$placeholder.png'),
(14, 31, 'Proyecto 12', 'erspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil mole', 'project_default_4.png', 'placeholder.png$$placeholder.png$$placeholder.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `qm_user`
--

CREATE TABLE IF NOT EXISTS `qm_user` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `qm_user`
--

INSERT INTO `qm_user` (`_id`, `name`, `pass`) VALUES
(1, 'garoot', '123456');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
