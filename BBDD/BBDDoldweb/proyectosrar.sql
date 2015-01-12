-- phpMyAdmin SQL Dump
-- version 2.10.1deb2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 12-01-2015 a las 08:56:43
-- Versión del servidor: 4.1.15
-- Versión de PHP: 4.4.2-1.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `proyectosrar`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tcnmsevilla`
-- 

CREATE TABLE `tcnmsevilla` (
  `idpro` int(5) NOT NULL auto_increment,
  `titulo` varchar(150) NOT NULL default '',
  `cabecera` text,
  `cuerpo` text,
  `anyo` year(4) NOT NULL default '0000',
  `mes` int(2) default NULL,
  `terminado` char(1) character set latin1 collate latin1_bin NOT NULL default '',
  PRIMARY KEY  (`idpro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `tcnmsevilla`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tgestores`
-- 

CREATE TABLE `tgestores` (
  `idgestor` int(3) NOT NULL auto_increment,
  `login` varchar(6) NOT NULL default '',
  `pass` varchar(6) NOT NULL default '',
  `permiso` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`idgestor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de gestores para las tablas de esta BD' AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `tgestores`
-- 

INSERT INTO `tgestores` (`idgestor`, `login`, `pass`, `permiso`) VALUES 
(1, 'admin1', 'admin1', 'sevilla'),
(2, 'admin2', 'admin2', 'cnm'),
(3, 'admin3', 'admin3', 'granada'),
(4, 'admin4', 'admin4', 'malaga');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tgrvcsevilla`
-- 

CREATE TABLE `tgrvcsevilla` (
  `idpro` int(5) NOT NULL auto_increment,
  `titulo` varchar(150) NOT NULL default '',
  `cabecera` text,
  `cuerpo` text,
  `anyo` year(4) NOT NULL default '0000',
  `mes` int(2) default NULL,
  `terminado` char(1) character set latin1 collate latin1_bin NOT NULL default '',
  PRIMARY KEY  (`idpro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para los proyectos del GRVC' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `tgrvcsevilla`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tgsigranada`
-- 

CREATE TABLE `tgsigranada` (
  `idpro` int(5) NOT NULL auto_increment,
  `titulo` varchar(150) NOT NULL default '',
  `cabecera` text,
  `cuerpo` text,
  `anyo` year(4) NOT NULL default '0000',
  `mes` int(2) default NULL,
  `terminado` char(1) character set latin1 collate latin1_bin NOT NULL default '',
  PRIMARY KEY  (`idpro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de proyectos del GSI' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `tgsigranada`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tisamalaga`
-- 

CREATE TABLE `tisamalaga` (
  `idpro` int(5) NOT NULL auto_increment,
  `titulo` varchar(150) NOT NULL default '',
  `cabecera` text,
  `cuerpo` text,
  `anyo` year(4) NOT NULL default '0000',
  `mes` int(2) default NULL,
  `terminado` char(1) character set latin1 collate latin1_bin default NULL,
  PRIMARY KEY  (`idpro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `tisamalaga`
-- 

