-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TeLoVendo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TeLoVendo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TeLoVendo` DEFAULT CHARACTER SET utf8 ;
USE `TeLoVendo` ;

-- -----------------------------------------------------
-- Table `TeLoVendo`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeLoVendo`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `Direccion_envio` VARCHAR(100) NULL,
  `saldo` INT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeLoVendo`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeLoVendo`.`articulo` (
  `n_articulo` INT NOT NULL AUTO_INCREMENT,
  `id_fabricas` INT NOT NULL,
  `Descripcion` TEXT NULL,
  PRIMARY KEY (`n_articulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeLoVendo`.`fabrica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeLoVendo`.`fabrica` (
  `id_fabrica` INT NOT NULL AUTO_INCREMENT,
  `n_articulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `a_total` INT NOT NULL,
  PRIMARY KEY (`id_fabrica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeLoVendo`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeLoVendo`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NULL,
  `direccion` VARCHAR(100) NULL,
  `fecha` DATE NULL,
  `n_articulo` INT NULL,
  `cantidad_p` INT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `TeLoVendo`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeLoVendo`.`detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeLoVendo`.`detalle_pedido` (
  `id_pedido` INT NOT NULL,
  `n_articulo` INT NULL,
  `cantidad` INT NULL,
  INDEX `n_articulo_idx` (`n_articulo` ASC) VISIBLE,
  INDEX `id_pedido_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `n_articulo`
    FOREIGN KEY (`n_articulo`)
    REFERENCES `TeLoVendo`.`articulo` (`n_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `TeLoVendo`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeLoVendo`.`fabrica_articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeLoVendo`.`fabrica_articulo` (
  `id_fabrica` INT NOT NULL,
  `n_articulo` INT NOT NULL,
  INDEX `id_fabrica_idx` (`id_fabrica` ASC) VISIBLE,
  INDEX `n_articulo_idx` (`n_articulo` ASC) VISIBLE,
  CONSTRAINT `id_fabrica`
    FOREIGN KEY (`id_fabrica`)
    REFERENCES `TeLoVendo`.`fabrica` (`id_fabrica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `n_articulo`
    FOREIGN KEY (`n_articulo`)
    REFERENCES `TeLoVendo`.`articulo` (`n_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
