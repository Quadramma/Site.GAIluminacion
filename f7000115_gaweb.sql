-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-07-2014 a las 20:38:25
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Volcado de datos para la tabla `ga_category`
--

INSERT INTO `ga_category` (`_id`, `_category_type_id`, `description`) VALUES
(1, 1, 'Cristal de Bohemia'),
(2, 1, 'Colgantes'),
(8, 1, 'LED - Luminarias'),
(31, 2, 'Residenciales'),
(32, 2, 'Hoteleria & Comercial'),
(40, 1, 'LED - Lámparas'),
(49, 1, 'Plafones'),
(47, 1, 'LED'),
(50, 1, 'Pared'),
(51, 1, 'Exterior & Jardin'),
(52, 1, 'AMERI DESIGN'),
(53, 1, 'Cuadros y Esculturas'),
(54, 1, 'Lamp. de Pie'),
(55, 1, 'Lamp. de Mesa'),
(56, 1, 'Embutidos'),
(57, 1, 'Hoteleria'),
(58, 1, 'Hoteleria'),
(59, 1, 'Hotel'),
(60, 1, 'Hoteleria'),
(61, 1, 'Hoteleria');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=247 ;

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
(210, '23/1-00-0003-BW', 'NET', 8, 'Colgante ultra-chato de diseño minimalista con sistema de LED 44w. Genera una iluminación potente y difusa, ideal para suspender sobre mesas. Es regulable en altura. No dimmable. Diseño español de primera calidad.', 'Net Lumar.jpg', '', 'Net Lumar_slider.jpg$$SLIDE Colg NET 2.jpg$$SLIDE Colg NET 1.jpg', 'Diámetro 57,5cm. Regulable en altura', 'LED 44w. Lúz cálida 3000°K.', 'Blanco mate. Difusor satinado.'),
(211, '27-915002250601', 'Ledino by Philips', 8, 'Plafón moderno cuadrado con bordes redondeados, construido integralmente en aluminio. Los cabezales contienen un módulo de LED especialmente diseñado por Philips. Estos mismo son dirigbles y rotables en 360°. Efecto de luz dirigible, ideal para living y habitación 4x4m. máx. No dimmable. Garantía Philips de 1 año.', 'Ledino 4 LED plafonl Philips_oro.jpg', '', 'SLIDE Plafon Ledino cuadrado 4L 3.jpg$$SLIDE Plafon Ledino cuadrado 4L 1.jpg$$SLIDE Plafon Ledino cuadrado 4L 2.jpg', '28,4 x 28,4cm. Saliente 7,7cm.', 'LED 4 x 7,5w. Lúz cálida 3100°K', 'Blanco mate. Parte trasera cabezal negro mate.'),
(212, '23/1-05-4415-78', 'Supple', 8, 'Aplique de pared con brazo flexible para lectura, con sistema de iluminación LED de alta potencia, ideal para el costado de la cama o escritorio. Luz dirigida. Angulo de lúz 140°. Diseño español de primera calidad.', 'Supply Lumar.jpg', '', 'Supply Lumar_2.jpg$$Supply Lumar_2.jpg$$Supply Lumar_2.jpg', 'Base diámetro 11,6cm. Saliente brazo 37cm.', 'LED 4,5w. Lúz cálida 3000°K.', 'Blanco mate + Policarbonato transparente'),
(213, '21/1-CL0003', 'LED 10x3w', 8, 'Colgante ultra-chato de diseño minimalista. Tecnología LED con un consumo total de 30w. Vida útil 30.000hs. No dimmable. Efecto de iluminación difuso, ideal para mesa de comedor o para el centro de su ambiente. Disponible en otros tamaños (consultar).', 'CL003_LUCCIOLA_2.jpg', '', 'Slider-Collg CL003.jpg$$Slider-Collg CL003 1.jpg$$Slider-Collg CL003 2.jpg', 'Diámetro 60cm. Regulable en altura', 'LED 10x3w. Lúz cálida 3000°K', 'Acrílico traslúcido circular. Base cromo brillante.'),
(214, '2-5813', 'Piastra', 52, 'Aplique de pared fabricado artesanalmente en Italia bajo la técnica "Piastra". En el centro podemos apreciar la pieza principal en color ambar arenado. El borde se aplica luego como un hilo de cristal. Todos los procesos son realizamos a mano uno por uno. Genera un efecto de iluminación difusa. Apto para colocar dimmer.', 'Piastra aplique pared.jpg', '', 'Slider-Piastra 1.jpg$$Slider-Piastra 3.jpg$$Slider-Piastra 2.jpg', 'Ancho 35cm. Alto 30cm. Saliente 12cm.', '1 x E27 100w máx. Rosca clásica.', 'Cristal de murano ambar. Sujeción metal cromado'),
(215, '23/1-25-2580-AH', 'Arc', 54, 'Lámpara de pie ARC, diseñados en España por GROK. Efecto difuso, luz indirecta. Potencia hasta 300w con regulador de intensidad.', 'Thumb_arc.jpg', '', 'SLIDE ARC pie 1.jpg$$SLIDE ARC pie 2.jpg$$SLIDE ARC pie 3.jpg', 'h: 190cm x 21cm', 'Cuarzo R7S 118mm 300w máx.', 'Gris aluminio anodizado / Negro'),
(216, '15-ME-LP', 'HOPE', 54, 'Lámpara de pie de diseño moderno, conformada por múltiples capas de acrílico prismático. Generar un efecto visual impactante. Se recomienda para espacios amplios por su diámetro. Efecto de iluminación difusa.', 'Thumb_Hope.jpg', '', 'SLIDE Medusa 1.jpg$$SLIDE Medusa 2.jpg$$SLIDE Medusa 3.jpg', 'h 195cm x diámetro 70cm', '1 x E27 100w máx. Rosca clásica', 'Acrílico prismático de alta calidad. Base cromo.'),
(217, '23/1-25-2726', 'Umbrella', 54, 'Lámpara de pie con base de diseño enroscado. Apoyo innovador que esta unida a la parte central que sostiene la campana de 450mm de diámetro. La misma esta construida en acrílico de alta calidad. El interior se encuentra revestido por un material corrugado que aporta un detalle distintivo a este modelo. El efecto de iluminación es dirigida hacia abajo, por lo cual genera una atmósfera de intimidad.', 'Thumb_UMBRELLA.jpg', '', 'SLIDE umbrella 1.jpg$$SLIDE umbrella 2.jpg$$SLIDE umbrella 3.jpg', 'h 1595mm x diámetro 450mm', '3 x E14 11w bajo consumo. Rosca mignon.', 'Exterior negro e interior oro ó exterior blanco e interior gris.'),
(218, '23/1-25-4339-21', 'Virginia', 54, 'Lámpara de pie moderna y funcional. De diseño compacto, regulable en altura, apta para ambientes reducidos. La pantalla de color negro es la original, pero existe la posibilidad de intercambiarla por otro color/tela (Consulte a su vendedor). Dentro de la pantalla se pueden colocar 3 lámpara tipo bajo consumo rosca E27 de 21w c/u. Suficiente iluminación para ser una buena lámpara de lectura. Dispone de una tapa de acrílico en la parte supercior de la pantalla para generar un efecto difuso sobre las paredes.', 'Thumb_virginia.jpg', '', 'SLIDE virginia 1.jpg$$SLIDE virginia 3.jpg$$SLIDE virginia 1.jpg', 'h 1700mm x Diámetro 450mm', '3 x E27 21w bajo consumo. Rosca clásica', 'Base en gris grafito, barral central cromado con regulación de altura. Pantalla negra con borde cromo superior.'),
(219, '23/1-25-0264', 'Magma', 54, 'Lámpara de pie de diseño informal y funcional. Regulable en altura. En la base se encuentran 4 ruedas que permiten su fácil desplazamiento y que aportan un extra el diseño. La pantalla esta construida con cintas generando un efecto desparejo y muy cool. La misma se puede pivotear para acomodarla a su gusto. Efecto de iluminación difuso.', 'Thumb_MAGMA.jpg', '', 'SLIDE magma 1.jpg$$SLIDE magma 2.jpg$$SLIDE magma 3.jpg', 'h mínima 1315mm. Máxima 1675mm x Diámetro 350mm', '1 x E27 30w bajo consumo. Rosca clásica.', 'Base color gris grafito. Parte central gris grafito combinada con cromo. Pantalla de cintas en color negro o blanco.'),
(220, '17-650128', 'YASMINA', 1, 'Araña de Cristal de Bohemia contemporánea de autentico cristal satinado. Elegante y sofisticada. Con gran diámetro y baja altura total, ideal para techos en departamentos. Efecto de iluminación difuso. Regulable en altura por cadena.', 'Yasmina 16 luces.jpg', '', 'Yasmina 16L_1.jpg$$Yasmina 16L_2.jpg$$Yasmina 16L_3.jpg', 'Díametro 95cm x h:66cm', '40 luces G9 40w 220v', 'Cristal de Bohemia satinado.'),
(221, '17-650165', 'SOROLLA', 1, 'Sorolla es un modelo particular en su diseño. Los brazos que lo componen se fabrican artesanalmente; debido a su longitud se puede curvar y transformar, en una sola pieza. Tiene en sus 2 opcion de tamaño suficiente diámetro para un espacio amplio, con techos bajos especialmente. Efecto de iluminación difuso. Regulable en altura con cadena de acero.', 'Sorolla16L_1.jpg', '', 'Sorolla_16L_1.jpg$$Sorolla_16L_2.jpg$$Sorolla_16L_3.jpg', '12 luces diámetro 90cm x h:65cm // 16 luces diámetro 110cm x h:65cm', 'E14 40w 220v. Rosca mignon.', 'Cristal de Bohemia transparente'),
(222, '17-650156', 'TOLEDO', 1, 'Araña de Cristal de Bohemia modelo TOLEDO combinada con cristal transparente y púrpura. Disponible en 8 luces, 16 luces, aplique de pared 2 luces y velador de 1 luz.', 'Toledo 16 luces.jpg', '', 'Toledo 16L_1.jpg$$Toledo 16L_2.jpg$$Toledo 16L_3.jpg', '8 luces diámetro 73cm x h:68cm // 16 luces diámetro 102cm x h:80cm', 'E14 40w 220v. Rosca mignon.', 'Cristal de Bohemia transparente combinado con purpura.'),
(223, '17-630501', 'ARIZONA', 1, 'Colgante moderno construido con cristal óptico. Máximo brillo y transparencia. Ideal para suspender sobre una mesa. Opción para armar de 2 o 3 colgantes montados sobre una base de acero para cubrir mesas 2m. en adelante. Efecto de iluminación difusa.', 'Arizona colg_foto.jpg', '', 'Arizona colg_1.jpg$$Arizona colg_2.jpg$$Arizona colg_3.jpg', 'Diámetro 43cm', '1xE27 100w. Rosca clásica.', 'Cristal óptico transparente'),
(224, '17-640136', 'BERNA', 1, 'Berna es un diseño moderno en cristal transparente. Disponibles 2 tamaños. Ideal para instalar en comedor, living y/o habitación. Efecto de iluminación difuso. Regulable en altura con cadena de acero.', 'Berna_foto.jpg', '', 'Berna_1.jpg$$Berna_2.jpg$$Berna_3.jpg', '12 luces diámetro 60cm x h:64cm // 32 luces diámetro 90cm x h:70cm', 'G9 40w 220v', 'Cristal de Bohemia transparente'),
(225, '17-620189', 'SURREY', 1, 'SURREY es una familia de lámparas de cristal que incluye 3 tamaños tipo candelabro de estilo contemporáneo.', 'Surrey_foto.jpg', '', 'Surrey 14L_1.jpg$$Surrey 14L_2.jpg$$Surrey 14L_3.jpg', '8 luces diámetro 70cm x h:60cm // 10 luces diámetro 90cm x h:70cm // 14 luces diámetro 90cm x h:100cm', 'E14 40w 220v. Rosca mignon.', 'Cristal de Bohemia transparente'),
(226, '17-630106', 'ESTRELLA', 1, 'Estrella lleva este nombre por el diseño de la decoración en cristal realizada manualmente. Cada brazo de este modelo contiene en su extremo y en la pieza central una seria de prismas de primera calidad.', 'Estrella_foto.jpg', '', 'Estrella_1.jpg$$Estrella_2.jpg$$Estrella_3.jpg', '8 luces diámetro 78cm x h:63cm // 15 luces diámetro 85cm x h:78cm', 'E14 40w 220v. Rosca mignon', 'Cristal de Bohemia transparente'),
(227, '23/1-25-2407', 'LEYLA PIE', 54, 'Lámpara de pie tripode Leyla, de diseño moderno y muy funcional: permite elegir 2 efectos de iluminación, directo o indirecto. Encendidos de forma separada o conjunta. Producido en España.', 'Thumb_Leyla.jpg', '', 'SLIDE leyla pie 1.jpg$$SLIDE leyla pie 2.jpg$$SLIDE leyla pie 3.jpg', 'Diametro 50cm x h:175cm', 'Luz indirecta 3 G9 40w 220v / Interior pantalla 3 E27 20w rosca clásica.', 'Pantalla blanca ó negra. Pie cromado/anodizado'),
(228, '58-TRIPODE CAMPANOTA P', 'TRIPODE CAMPANOTA P', 54, 'Lámpara de pie tripode campanota P, con pantalla cónica grande de lino natural. Base de caño en aluminio natural. Efecto de iluminación difuso.', 'Thumb_Tripode C.jpg', '', 'SLIDE Tripode C 1.jpg$$SLIDE Tripode C 2.jpg$$SLIDE Tripode C 2.jpg', 'Pantalla: diámetro 54cm x h:49cm / Altura con base 165cm', '1 E27 40w máx. rosca clásica.', 'Base de aluminio. Pantalla original de lino natural.'),
(229, '58-TRINI TAMBOR P', 'TRINI TAMBOR P', 54, 'Lámpara de pie trini tambor esta construida en madera, torneada manualmente. Disponible en madera clara o wengue oscuro. De estilo nordico, ideal para iluminar y decorar ambientes del estilo. La pantalla puede ser cambiada por otros géneros de nuestra colección. Efecto de iluminación difuso.', 'Thumb_Trini Tambor.jpg', '', 'SLIDE Trini T 1.jpg$$SLIDE Trini T 2.jpg$$SLIDE Trini T 3.jpg', 'Pantalla diámetro 49cm x h:25cm / Base con pantalla h:157cm', '1 E27 40w 220v rosca clásica', 'Base de madera natural o wengue / Pantalla de lino natural'),
(230, '16-MUMA CAMPANOTA P', 'MUMA CAMPANOTA P', 54, 'Lámpara de de pie tripode. Madera torneada manualmente en color natural claro o wengue oscuro. Pantalla de lino natural o de otros géneros a elección. Efecto de iluminación difuso.', 'Thumb_Muma Campanota.jpg', '', 'SLIDE Muma Campanota 1.jpg$$SLIDE Muma Campanota 2.jpg$$SLIDE Muma Campanota 3.jpg', 'Pantalla diámetro 54cm x h:49cm. / Base con pantalla h:160cm', '1 E27 40w 220v rosca clásica.', 'Base de madera natural o wengue / Pantalla de lino natural'),
(231, '15-ARCO', 'ARCO', 54, 'Famoso modelo arco disponible en 2 tamaños. Base de marmol tipo carrara, blanco con vetas grises. Arco y campana metálicos, terminación platil mate. Peso base grande: 68Kg. Peso base chica: 38Kg. Arco regulable en altura y en extensión. Ideal para decorar, genera un efecto de luz íntimo.', 'Thumb_Arco.jpg', '', 'SLIDE Pie Arco 3.jpg$$SLIDE Pie Arco 2.jpg$$SLIDE Pie Arco 1.jpg', 'Arco grande 2300x h:2300mm / Arco chico 1450x h:1600mm', '1 E27 100w 220v rosca clásica', 'Arco grande y chico: Marmol tipo carrara, arco de metal y campana platil mate.'),
(232, '23/1-25-2782-AH', 'ESCHER', 54, 'Lámpara Escher, un diseño español minimalista. La base en forma cuadrada es ideal para colocar en un rincón de su espacio, generando un efecto de iluminación con potencia, totalmente difuso. Regulación de intensidad gradual con interruptor al piso.', 'Thumb_escher.jpg', '', 'SLIDE escher pie 1.jpg$$SLIDE escher pie 2.jpg$$SLIDE escher pie 3.jpg', 'Altura 1880mm x 270mm x 270mm', '1 cuarzo 300w dimmable.', 'Gris - Aluminio anodizado'),
(243, '21-ETL400 / ETL500-01-02-04', 'KEVIN', 47, 'Nueva tecnología en LED:COB, chip-on-board. Este artefacto integra su esctructura de aluminio al chip de LED, consiguiendo una alta disipación de calor que redunda en la vida útil del artefacto. Genera un efecto de iluminación difuso, ideal para grandes areas de trabajo y de uso permanente. No acepta dimmer. Incluye fuente a 12v-220v. Único color.', 'Thumb_Kevin.jpg', '', 'SLIDE Emb Kevin_3.jpg$$SLIDE Emb Kevin_2.jpg$$SLIDE Emb Kevin_1.jpg', '3w 10cm / 7w 14cm / 14w 19cm / 20w 23cm / 40w 23cm', '3w / 7w / 14w / 20w / 40w', 'Blanco mate de aluminio. Difusor de vidrio satinado.'),
(244, '21-ETL508', 'COBO', 47, 'Nueva tecnología en LED:COB, chip-on-board. Este artefacto integra su esctructura de aluminio al chip de LED, consiguiendo una alta disipación de calor que redunda en la vida útil del artefacto. Genera un efecto de luz dirigido, similar al de una dicroica halógena clásica. Pivoteable. Semi estanco, con vidrio transparente como protección. Incluye fuente de alimentación 12v-220v. No dimmable.', 'Thumb_Emb COBO.jpg', '', 'SLIDE Emb COBO_1.jpg$$SLIDE Emb COBO_2.jpg$$SLIDE Emb COBO_3.jpg', 'Diámetro 110mm', 'LED COB 14w 3000°K. No dimmable', 'Platil mate ó blanco mate. Vidrio transparente.'),
(235, '23/1-IBISC/37-81', 'IBIS', 49, 'Plafón modelo IBIS con efecto de luz indictecto que prioriza el confort visual. La lámpara de cuarzo de 200w que utiliza brinda suficiente iluminación para un living o habitación de 4x4m. El efecto indirecto hace que la luz "rebote" en el techo y en la base del mismo, manteniendo oculta la lámpara. Apto para dimmer. Único color. Producido en España.', 'Thumb_IBIS PLAFON.jpg', '', 'SLIDE IBIS PLAFON_1.jpg$$SLIDE IBIS PLAFON_2.jpg$$SLIDE IBIS PLAFON_3.jpg', 'Diámetro 24cm x h:24cm', '1x200w Cuarzo 118mm. Dimmable', 'Plate mate. Base blanco mate.'),
(236, '23/1-15-2020-14', 'Saturn', 8, 'Saturn es un nuevo concepto de iluminación. De efecto indirecto que prioriza el confort visual, oculta la fuente de luz brindando un efecto único. Incluye un sistema de LED de 9W ó 4W dependiente del tamaño. El tono de lúz es cálido, totalmente agradable a la vista, sin cambiar los tonos del ambiente. Producido en España.', 'Thumb_SATURN.jpg', '', 'SLIDE SATURN_1.jpg$$SLIDE SATURN_2.jpg$$SLIDE SATURN_3.jpg', 'Grande: Diámetro 28,5cm x h:12cm // Chico 18,3cm x h:7,8cm.', 'Grande: LED 1x9W COB. Lúz cálida. // Chico LED 1x4w COB. Lúz cálida.', 'Blanco mate'),
(237, '23-B5335/15', 'FRIDA PLAFON', 49, 'Plafón FRIDA con moderna tulipa de vidrio opal con forma de disco. De diseño discreto y moderno, genera un efecto de iluminación totalmente difuso. Ideal para generar un gran volumen de luz en su ambiente. Disponible en 2 tamaños de plafón y en 2 tamaños de colgante, combinable en living/comedor y ambientes integrados. Contiene una base de metal cónico que mantiene el vidrio a 15cm del techo, disponible en color blanco mate o platil. Apto para dimmer.', 'Thumb_FRIDA.jpg', '', 'SLIDE FRIDA_1.jpg$$SLIDE FRIDA_3.jpg$$SLIDE FRIDA_2.jpg', 'Grande: Diámetro 51cm x h:20cm // Chico: Diámetro 37cm x h:20cm', 'Grande: 1x300w 118mm cuarzo halógeno ó 3xE27 rosca clásica bajo consumo // Chico: 1x150w cuarzo halógeno 78mm.', 'Vidrio opal. Base cónico de metal blanco o platil.'),
(238, '23/1-05-4356-14', 'Skata', 49, 'El plafón Skata, que se comercializa por unidad, tiene en su base una conexión preparada para adherir otros Skata. De este modo podemos generar conjuntos de luminarias y diseños realmente únicos. Apto para colocar en techo o pared. Apto para dimmer. La tulipa de vidrio irregular se encima con otra para generar continuidad y armonia en el diseño.', 'Thumb_SKATA.jpg', '', 'SLIDE SKATA_1.jpg$$SLIDE SKATA_2.jpg$$SLIDE SKATA_3.jpg', 'Diámetro irregular 20cm x h:10cm', '1x60w G9 Halopin 220v. Halógeno.', 'Vidrio opal. Base de metal platil.'),
(239, '23/1--25-1823/14', 'Medusa Pie', 54, 'Medusa, innovador diseño moderno y de forma orgánica. Construida en metal que mediante la exposición a la temperatura cede y permite ser curvado. Realmente una pieza que decora e ilumina al mismo tiempo. Opción de pantalla blanca o negra. No acepta dimmer.', 'Thumb_Medusa Pie.jpg', '', 'Medusa pie_1.jpg$$Medusa pie_2.jpg$$Medusa pie_3.jpg', 'Díametro 60cm x h:166cm', '1X30w E27 rosca clásica bajo consumo o LED.', 'Base blanco mate. Pantalla blanca o negra.'),
(240, '23/1-10-1824-14/05', 'Medusa Mesa', 55, 'Medusa, innovador diseño moderno y de forma orgánica. Construida en metal que mediante la exposición a la temperatura cede y permite ser curvado. Realmente una pieza que decora e ilumina al mismo tiempo. Opción de pantalla blanca o negra. No acepta dimmer.', 'Thumb_Medusa.jpg', '', 'Medusa mesa_1.jpg$$Medusa mesa_2.jpg$$Medusa mesa_3.jpg', 'Diámetro 45cm x h:75cm', '1xE27 18w bajo consumo ó LED. Rosca clásica.', 'Base blanca mate. Pantalla blanca ó negra.'),
(241, '23/1-20-2407-14/05', 'Leila Doble', 2, 'El colgante Leila doble es una solución para su comedor. Con una estructura central que sostiene las pantallas, desde una misma salida de luz podemos iluminar con suficiente potencia. Asimismo, este colgante genera un doble efecto: en la parte superior de cada pantalla utiliza 2 lámparas tipo halopin G9 40w que a su vez son dimmables. En la parte interior de cada pantalla utiliza 2 lámparas de rosca E27 bajo consumo, que cubiertas con el vidrio difusor, genera un efecto difuso, de luz general.\nEs regulable en altura desde el barral central. Diseñado y producido en España por Benedito Design.', 'Thumb_Leyla Doble colgante.jpg', '', 'SLIDE Leila doble colgante_1.jpg$$SLIDE Leila doble colgante_2.jpg$$SLIDE Leila doble colgante_3.jpg', 'Longitud total 1050mm x h: min.680mm máx:1000mm. Pantallas diámetro 33cm x 17cm.', 'Indirecto 2xG9 40w 220v / Directo 2xE27 20w bajo consumo. Rosca clásica.', 'Estructura metálica cromada. Pantalla negra o blanca.'),
(242, '17-620188', 'VIRGINIA CLEAR', 1, 'Virginia es una colección de mini-arañas en Cristal de Bohemia. Su reducido tamaño hace posible la instalación en ambientes de reducida superficie y/o techos bajos. Disponible en 3 tamaños, se puede instalar individualmente o puede ser armada en conjunto de a 2 ó 3 para suspender sobre mesas de 2,5 - 3m. de longitud. Diseñamos la luminaria adecuada a su espacio.', 'Thumb_Virginia Clear.jpg', '', 'SLIDE Virginia 8L_1.jpg$$SLIDE Virginia 6L_2.jpg$$SLIDE Virginia 6L_3.jpg', '4 luces Diám. 56cm x h:59cm / 6 luces Diám. 56cm x h:59cm / 8 luces Diám. 63cm x h:66cm', 'E14 40w 220v. Rosca mignon.', 'Cristal de Bohemia transparente. Detalles en metal cromado'),
(245, '68-DR-3', 'MINI COB R', 47, 'Nuevo mini-embutido con tecnología COB LED (Chip-on-board). Para exigencias arquitectónicas especiales, ideal para generar efectos en ambientes con bajo nivel de deslumbramiento. Contiene una óptica de alto rendimiento que a su vez es rotable. Construido en aluminio para una eficaz disipación del calor. Incluye fuente y soporte de sujeción a techo. No dimmable.', 'Thumb_Emb MINI COB.jpg', '', 'SLIDE DOMO MINI COB_1.jpg$$SLIDE DOMO MINI COB_2.jpg$$SLIDE Emb COBO_3.jpg', 'Diámetro 55mm. Profundidad 40mm. (Agujero 48mm)', 'LED COB 1x3w 3000°K Lúz cálida. No dimmable.', 'Blanco mate'),
(246, '68-DC-3', 'MINI COB S', 47, 'Nuevo mini-embutido con tecnología COB LED (Chip-on-board). Para exigencias arquitectónicas especiales, ideal para generar efectos en ambientes con bajo nivel de deslumbramiento. Contiene una óptica de alto rendimiento que a su vez es rotable. Construido en aluminio para una eficaz disipación del calor. Incluye fuente y soporte de sujeción a techo. No dimmable.', 'Thumb_Emb MINI COB_S.jpg', '', 'SLIDE DOMO MINI COB cuad_2.jpg$$SLIDE DOMO MINI COB cuad_1.jpg$$SLIDE Emb COBO_3.jpg', '60x60mm. Profundidad 40mm. (Agujero 45x45mm)', 'LED COB 1x3w 3000°K Lúz cálida. No dimmable.', 'Blanco mate.');

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
(1, 32, 'Imperiale Luxury Condominiums - Punta del este', 'Proyecto realizado en Puntal del Este. Instalación de 1 araña en Cristal de Bohemia modelo Georgia para el lobby y 2 arañas Victorian 8 luces para los livings del mismo sector. Esta misma instalación realizada en las 3 torres que conforman el condominio de lujo.', 'thumb_Imperiale.jpg', 'Imperiale 1.jpg$$Imperiale_3.jpg$$Imperiale_2.jpg'),
(2, 32, 'Hotel Amerian Carlos V - Termas de Rio Hondo', 'Unos de nuestro principales proyectos realizados en Santiago del Estero, en la ciudad de Termas de Rio Hondo. El hotel Amerian Carlos V es el más nuevo, moderno y lujoso hotel de la ciudad. Se resalta por si arquitectura y por sus imponentes lámparas en Cristal de Bohemia. Realizamos la instalación de 1 Royal 75 luces y 3 Royal de 45 luces en el lobby y sectores linderos al mismo. Nuestras lámparas aportan un gran valor estético al ambiente siendo las joyas del hotel.', 'thumb_Amerian.jpg', 'Amerian_1.jpg$$Amerian_2.jpg$$Amerian_3.jpg'),
(3, 32, 'Hotel Holiday Inn Ezeiza', 'Hotel Holiday Inn Ezeiza, el hotel más nuevo y cercano al Aeropuerto Internacional Ministro Pistarini, en Buenos Aires. Hemos seleccionado e instalado 1 araña de Cristal de Bohemia modelo Vermont 65 luces en color silver combinada con cristales transparentes. En la primera versión se colocó sobre un techo de madera y luego se procedío a la terminación en durlok con la "garganta" que contiene un sistema de LEDs RGB. \nTambién hemos realizado la iluminación y decoración de la Suite Presidencial y de los sectores comunes del 1° piso del hotel.', 'Howard Jhonson Ezeiza_3.jpg', 'Howard Jhonson Ezeiza_1.jpg$$Howard Jhonson Ezeiza_2.jpg$$Howard Jhonson Ezeiza_3.jpg'),
(4, 32, 'Palacio Leloir Eventos', 'En Palacio Leloir eventos aportamos belleza, diseño y nivel mediante la instalación de 1 araña en Cristal de Bohemia modelo Vermont 65 luces en su combinación silver-black mix. Es uno de nuestros diseños más exitosos para techo de gran altura y espacios amplios.', 'Thumb_Palacio Leloir.jpg', 'Palacio Leloir_1.jpg$$Palacio Leloir_2.jpg$$Palacio Leloir_3.jpg'),
(7, 31, 'Residencia en Concordia- Entre Ríos', 'Instalación de 1 araña en Cristal de Bohemia modelo Vermont 65 luces Silver-Black mix en el living de una residencia privada en Concordia, Entre Ríos. Con más de 500m2 cubiertos, nuevamente nuestras lámparas embellecieron aportando glamour y estilo. La calidad de nuestros cristales se reconocen por el brillo inigualable.', 'thumb_Concordia.jpg', 'Concordia_1.jpg$$Concordia_2.jpg$$Concordia_3.jpg'),
(8, 31, 'Residencia Brio. Privado "Venado 1"-Buenos Aires', 'Residencia privada ubicada en Canning, partido de Esteban Echeverría en Buenos Aires. Super moderna y minimalista, contrasta y se complementa a la perfección con nuestra lámpara en Cristal de Bohemia modelo Royal 45 luces. El cristal, un material puro que aporta brillo y exclusividad genera un corte dentro la estructura simple y despojada. Una tendencia en el mundo es la combinación de estilos y de elementos contrastantes.', 'thumb_Venado 1.jpg', 'Venado 1_1.jpg$$Venado 1_2.jpg$$Venado 1_3.jpg'),
(9, 32, 'Palacio Alsina + State', 'Enigmatico y clásico, el Palacio Alsina es un salon de eventos privados y corporativos más destacado de Buenos Aires. A su vez aquí, bajo del nombre "State" se realizan las principales fiestas de música electrónica que convoca a los más famosos DJ´s del mundo. Con una arquitectura clásica y espacios amplios, nuevamente aportamos joyas de cristal para que el edificio se destaque. Con un carácter decorativo, las mismas rara vez se ven encendidas debido a los proyectores de LED que la tonalizan según la ocación. El brillo como siempre es único.', 'thumb_State.jpg', 'State_2.jpg$$State_3.jpg$$State_1.jpg'),
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
  `esBackendUser` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `qm_user`
--

INSERT INTO `qm_user` (`_id`, `name`, `pass`, `esBackendUser`, `email`) VALUES
(1, 'garoot', '123456', 1, ''),
(5, 'federico ameri', NULL, 0, 'fede_ameri@hotmail.com'),
(6, 'Jorge Mastrantuoni', NULL, 0, 'jorgeluismas@hotmail.com'),
(7, 'Prueba', NULL, 0, 'prueba@prueba.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
