CREATE TABLE `Proveedor` (
`idProveedor` int NOT NULL AUTO_INCREMENT,
`nombreProveedor` varchar(100) NOT NULL,
`direccionProveedor` varchar(255) NOT NULL,
`rfcProveedor` varchar(13) NULL DEFAULT N/A,
`logo` varchar(255) NULL DEFAULT N/A,
`status` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idProveedor`) 
);
CREATE TABLE `Usuario` (
`idUser` int NOT NULL AUTO_INCREMENT,
`nombreUser` varchar(100) NOT NULL,
`ape1User` varchar(100) NOT NULL,
`ape2User` varchar(100) NULL,
`direccionUser` varchar(255) NULL,
`rfcUser` varchar(13) NULL DEFAULT N/A,
`nnsUser` varchar(11) NULL DEFAULT N/A,
`statusUser` tinyint NOT NULL DEFAULT 1,
`idRol` int NOT NULL,
`idTienda` int NOT NULL,
PRIMARY KEY (`idUser`) 
);
CREATE TABLE `RolUser` (
`idRol` int NOT NULL AUTO_INCREMENT,
`rol` varchar(50) NOT NULL,
`descripcionRol` varchar(255) NULL,
`statusRol` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idRol`) 
);
CREATE TABLE `Tienda` (
`idTienda` int NOT NULL AUTO_INCREMENT,
`nombreTienda` varchar(100) NOT NULL,
`descripcionTienda` varchar(150) NULL,
`direccionTienda` varchar(255) NOT NULL,
`rfcTienda` varchar(13) NULL,
`statusTienda` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idTienda`) 
);
CREATE TABLE `TipoVariante` (
`idTipoVariante` int NOT NULL AUTO_INCREMENT,
`nombreTipoVariante` varchar(50) NOT NULL,
`descripcionTipoVariante` varchar(255) NULL,
`statusTipoVariante` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idTipoVariante`) 
);
CREATE TABLE `Valores` (
`idValor` int NOT NULL AUTO_INCREMENT,
`descripcionValor` varchar(255) NOT NULL,
`statusValor` tinyint NOT NULL,
PRIMARY KEY (`idValor`) 
);
CREATE TABLE `Variante` (
`idVariante` int NOT NULL AUTO_INCREMENT,
`idArticulo` int NOT NULL,
`idTipoVariante` int NOT NULL,
`idValor` int NOT NULL,
`stock` int NOT NULL,
`precio` float(11,2) NOT NULL,
`statusVariante` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idVariante`) 
);
CREATE TABLE `Articulo` (
`idArticulo` int NOT NULL AUTO_INCREMENT,
`nombreArticulo` varchar(100) NOT NULL,
`descripcionArticulo` varchar(255) NULL,
`idCategoria` int NOT NULL,
`statusArticulo` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idArticulo`) 
);
CREATE TABLE `Categoria` (
`idCategoria` int NOT NULL AUTO_INCREMENT,
`idPrimario` int NOT NULL,
`idSecundario` int NOT NULL,
`idTerciario` int NOT NULL,
`statusCategoria` varchar(255) NULL,
PRIMARY KEY (`idCategoria`) 
);
CREATE TABLE `Primario` (
`idPrimario` int NOT NULL AUTO_INCREMENT,
`nombrePrimario` varchar(100) NOT NULL,
`descripcionPrimario` varchar(255) NULL,
`statusPrimario` tin NOT NULL DEFAULT 1,
PRIMARY KEY (`idPrimario`) 
);
CREATE TABLE `Secundario` (
`idSecundario` int NOT NULL AUTO_INCREMENT,
`nombreSecundario` varchar(100) NOT NULL,
`descripcionSecundario` varchar(255) NULL,
`statusSecundario` tin NOT NULL DEFAULT 1,
PRIMARY KEY (`idSecundario`) 
);
CREATE TABLE `Terciario` (
`idTerciario` int NOT NULL AUTO_INCREMENT,
`nombreTerciario` varchar(100) NOT NULL,
`descripcionTerciario` varchar(255) NULL,
`statusTerciario` tin NOT NULL DEFAULT 1,
PRIMARY KEY (`idTerciario`) 
);
CREATE TABLE `TipoPago` (
`idTipoPago` int NOT NULL AUTO_INCREMENT,
`descripcionTipoPago` varchar(50) NOT NULL,
PRIMARY KEY (`idTipoPago`) 
);
CREATE TABLE `Cliente` (
`idCliente` int NOT NULL AUTO_INCREMENT,
`nombreCliente` varchar(60) NOT NULL,
`ape1Cliente` varchar(50) NOT NULL,
`ape2Cliente` varchar(50) NULL,
`direccionCliente` varchar(255) NULL,
`rfcCliente` varchar(13) NULL,
`usuarioCliente` varchar(255) NULL,
`passwordCliente` varchar(255) NULL,
`statusCliente` tinyint NOT NULL DEFAULT 1,
PRIMARY KEY (`idCliente`) 
);
CREATE TABLE `FormaPago` (
`idFormaPago` int NOT NULL AUTO_INCREMENT,
`idCliente` int(11) NOT NULL,
`idTipoPago` int NOT NULL,
`numero` int(18) NOT NULL,
`cvv` int NULL,
PRIMARY KEY (`idFormaPago`) 
);
CREATE TABLE `DetalleCompra` (
`idDetalleCompra` int NOT NULL AUTO_INCREMENT,
`idProveedor` int NOT NULL,
`idVariante` int NOT NULL,
`cantidad` int(11) NOT NULL,
`precio` float(11,2) NOT NULL DEFAULT 0.00,
`idCompra` int NOT NULL,
PRIMARY KEY (`idDetalleCompra`) 
);
CREATE TABLE `Compra` (
`idCompra` int NOT NULL AUTO_INCREMENT,
`fechaCompra` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`idCompra`) 
);
CREATE TABLE `Venta` (
`idVenta` int NOT NULL AUTO_INCREMENT,
`idUser` int NOT NULL,
`idCliente` int NOT NULL,
`fechaVenta` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`idVenta`) 
);
CREATE TABLE `DetalleVenta` (
`idDetalleVenta` int NOT NULL AUTO_INCREMENT,
`idVenta` int(11) NOT NULL,
`idVariante` int NOT NULL,
`cantidad` int(11) NOT NULL,
`precio` float(11,2) NOT NULL,
PRIMARY KEY (`idDetalleVenta`) 
);

ALTER TABLE `Usuario` ADD CONSTRAINT `rol` FOREIGN KEY (`idRol`) REFERENCES `RolUser` (`idRol`);
ALTER TABLE `Usuario` ADD CONSTRAINT `tienda-user` FOREIGN KEY (`idTienda`) REFERENCES `Tienda` (`idTienda`);
ALTER TABLE `Categoria` ADD CONSTRAINT `primario` FOREIGN KEY (`idPrimario`) REFERENCES `Primario` (`idPrimario`);
ALTER TABLE `Categoria` ADD CONSTRAINT `secundario` FOREIGN KEY (`idSecundario`) REFERENCES `Secundario` (`idSecundario`);
ALTER TABLE `Categoria` ADD CONSTRAINT `terciario` FOREIGN KEY (`idTerciario`) REFERENCES `Terciario` (`idTerciario`);
ALTER TABLE `Articulo` ADD CONSTRAINT `categoria` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`);
ALTER TABLE `Variante` ADD CONSTRAINT `idValor` FOREIGN KEY (`idValor`) REFERENCES `Valores` (`idValor`);
ALTER TABLE `Variante` ADD CONSTRAINT `tipoVariante` FOREIGN KEY (`idTipoVariante`) REFERENCES `TipoVariante` (`idTipoVariante`);
ALTER TABLE `Variante` ADD CONSTRAINT `articulo` FOREIGN KEY (`idArticulo`) REFERENCES `Articulo` (`idArticulo`);
ALTER TABLE `FormaPago` ADD CONSTRAINT `cliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`);
ALTER TABLE `FormaPago` ADD CONSTRAINT `tipopago` FOREIGN KEY (`idTipoPago`) REFERENCES `TipoPago` (`idTipoPago`);

