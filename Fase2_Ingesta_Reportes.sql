USE CrediCoreDB;
GO

-- Limpieza preventiva para poder reejecutar el script las veces que quieras
TRUNCATE TABLE Operaciones.Creditos;
DELETE FROM Garantias.Vehiculos;
DBCC CHECKIDENT ('Garantias.Vehiculos', RESEED, 0);
DELETE FROM Operaciones.Clientes;
DBCC CHECKIDENT ('Operaciones.Clientes', RESEED, 0);
GO

-- ============================================================================
-- PARTE A1: INGESTA DE VEHÍCULOS (1,500 REGISTROS AUTOMATIZADOS)
-- ============================================================================
EXEC sp_executesql N'
SET NOCOUNT ON;

DECLARE @i INT = 1;
DECLARE @Anio INT;
DECLARE @Marca NVARCHAR(50);
DECLARE @Modelo NVARCHAR(50);
DECLARE @Color NVARCHAR(20);
DECLARE @Titulo NVARCHAR(50);
DECLARE @Placa NVARCHAR(20);
DECLARE @Chasis NVARCHAR(50);

WHILE @i <= 1500
BEGIN
    SET @Anio = 2015 + (@i % 9);
    
    SET @Marca = CASE (@i % 5)
        WHEN 0 THEN ''Toyota''
        WHEN 1 THEN ''Honda''
        WHEN 2 THEN ''Mazda''
        WHEN 3 THEN ''Hyundai''
        ELSE ''Ford''
    END;

    SET @Modelo = CASE (@i % 5)
        WHEN 0 THEN ''Corolla''
        WHEN 1 THEN ''Civic''
        WHEN 2 THEN ''CX-5''
        WHEN 3 THEN ''Tucson''
        ELSE ''Focus''
    END;

    SET @Color = CASE (@i % 4)
        WHEN 0 THEN ''Blanco''
        WHEN 1 THEN ''Negro''
        WHEN 2 THEN ''Gris''
        ELSE ''Azul''
    END;

    SET @Titulo = ''TIT-'' + RIGHT(''0000'' + CAST(@i AS VARCHAR(5)), 5);
    SET @Placa  = ''P-'' + RIGHT(''0000'' + CAST(@i AS VARCHAR(5)), 5) + ''BBB'';
    SET @Chasis = ''CHS-'' + RIGHT(''000000'' + CAST(@i AS VARCHAR(6)), 6);

    INSERT INTO Garantias.Vehiculos (Anio, Marca, Modelo, Color, NumeroTituloPropiedad, Placa, NumeroChasis)
    VALUES (@Anio, @Marca, @Modelo, @Color, @Titulo, @Placa, @Chasis);

    SET @i = @i + 1;
END;
';
GO
-- =========================================================
-- PARTE A2: INGESTA DE CLIENTES (Columnas: Nombres, Apellidos)
-- =========================================================
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000118', 'Lorena', 'Hernández', 'lorena.hernández1@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000135', 'Ana', 'Mérida', 'ana.mérida2@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000152', 'Alejandro', 'Martínez', 'alejandro.martínez3@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000169', 'Paola', 'Pérez', 'paola.pérez4@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000186', 'Raul', 'Hernández', 'raul.hernández5@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000203', 'Ramiro', 'Mérida', 'ramiro.mérida6@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000220', 'Sonia', 'Morales', 'sonia.morales7@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000237', 'Hector', 'Mendoza', 'hector.mendoza8@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000254', 'Luis', 'López', 'luis.lópez9@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000271', 'Juan', 'Rodríguez', 'juan.rodríguez10@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000288', 'Paola', 'Fuentes', 'paola.fuentes11@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000305', 'Patricia', 'López', 'patricia.lópez12@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000322', 'Gustavo', 'Rodríguez', 'gustavo.rodríguez13@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000339', 'Arturo', 'Rios', 'arturo.rios14@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000356', 'Monica', 'Cifuentes', 'monica.cifuentes15@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000373', 'Isabel', 'Martínez', 'isabel.martínez16@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000390', 'Beatriz', 'Salazar', 'beatriz.salazar17@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000407', 'Alejandro', 'Juárez', 'alejandro.juárez18@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000424', 'Carlos', 'Guzmán', 'carlos.guzmán19@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000441', 'Andrea', 'Chávez', 'andrea.chávez20@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000458', 'Eduardo', 'Reyes', 'eduardo.reyes21@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000475', 'Alejandro', 'Pérez', 'alejandro.pérez22@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000492', 'Jorge', 'Guzmán', 'jorge.guzmán23@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000509', 'Ricardo', 'Hernández', 'ricardo.hernández24@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000526', 'Juan', 'Castillo', 'juan.castillo25@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000543', 'Sofía', 'Vásquez', 'sofía.vásquez26@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000560', 'Fernanda', 'Estrada', 'fernanda.estrada27@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000577', 'Daniela', 'Juárez', 'daniela.juárez28@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000594', 'Luis', 'Mérida', 'luis.mérida29@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000611', 'Mario', 'Cifuentes', 'mario.cifuentes30@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000628', 'Pedro', 'Alvarado', 'pedro.alvarado31@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000645', 'Elena', 'Morales', 'elena.morales32@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000662', 'Gustavo', 'Díaz', 'gustavo.díaz33@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000679', 'Lorena', 'Estrada', 'lorena.estrada34@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000696', 'Javier', 'Salazar', 'javier.salazar35@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000713', 'Valeria', 'Chávez', 'valeria.chávez36@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000730', 'José', 'García', 'josé.garcía37@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000747', 'Alicia', 'Martínez', 'alicia.martínez38@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000764', 'Gonzalo', 'Díaz', 'gonzalo.díaz39@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000781', 'Juan', 'Pineda', 'juan.pineda40@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000798', 'Paola', 'Pineda', 'paola.pineda41@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000815', 'Sofía', 'Castillo', 'sofía.castillo42@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000832', 'Alejandro', 'Aguilar', 'alejandro.aguilar43@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000849', 'Lorena', 'Cabrera', 'lorena.cabrera44@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000866', 'Javier', 'González', 'javier.gonzález45@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000883', 'Javier', 'Vásquez', 'javier.vásquez46@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000900', 'Jorge', 'Barrios', 'jorge.barrios47@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000917', 'Alejandro', 'Chávez', 'alejandro.chávez48@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000934', 'Ramiro', 'Rios', 'ramiro.rios49@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000951', 'José', 'Estrada', 'josé.estrada50@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000968', 'Lorena', 'González', 'lorena.gonzález51@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100000985', 'Sonia', 'Mérida', 'sonia.mérida52@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001002', 'Miguel', 'González', 'miguel.gonzález53@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001019', 'Mario', 'Castillo', 'mario.castillo54@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001036', 'Alejandro', 'Alvarado', 'alejandro.alvarado55@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001053', 'Lorena', 'Chávez', 'lorena.chávez56@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001070', 'Gustavo', 'Martínez', 'gustavo.martínez57@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001087', 'Ramiro', 'Reyes', 'ramiro.reyes58@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001104', 'Gonzalo', 'Guzmán', 'gonzalo.guzmán59@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001121', 'María', 'Martínez', 'maría.martínez60@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001138', 'Luis', 'Juárez', 'luis.juárez61@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001155', 'Gabriela', 'Castillo', 'gabriela.castillo62@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001172', 'Alejandro', 'Morales', 'alejandro.morales63@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001189', 'Jorge', 'Alvarado', 'jorge.alvarado64@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001206', 'Claudia', 'Mejía', 'claudia.mejía65@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001223', 'Arturo', 'Reyes', 'arturo.reyes66@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001240', 'Jorge', 'Rios', 'jorge.rios67@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001257', 'Roberto', 'Castillo', 'roberto.castillo68@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001274', 'Oscar', 'Aguilar', 'oscar.aguilar69@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001291', 'Diego', 'Gómez', 'diego.gómez70@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001308', 'Lucía', 'Martínez', 'lucía.martínez71@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001325', 'Raul', 'Cifuentes', 'raul.cifuentes72@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001342', 'Sonia', 'Gómez', 'sonia.gómez73@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001359', 'Raul', 'Salazar', 'raul.salazar74@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001376', 'Eduardo', 'Mejía', 'eduardo.mejía75@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001393', 'Hector', 'Castillo', 'hector.castillo76@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001410', 'Javier', 'Martínez', 'javier.martínez77@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001427', 'Lucía', 'Fuentes', 'lucía.fuentes78@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001444', 'Roberto', 'Morales', 'roberto.morales79@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001461', 'Teresa', 'García', 'teresa.garcía80@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001478', 'Pedro', 'Pérez', 'pedro.pérez81@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001495', 'Lorena', 'González', 'lorena.gonzález82@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001512', 'Ramiro', 'Mendoza', 'ramiro.mendoza83@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001529', 'Patricia', 'Morales', 'patricia.morales84@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001546', 'Elena', 'Castillo', 'elena.castillo85@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001563', 'Patricia', 'Aguilar', 'patricia.aguilar86@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001580', 'Francisco', 'Gómez', 'francisco.gómez87@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001597', 'Gustavo', 'Pineda', 'gustavo.pineda88@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001614', 'Carlos', 'Barrios', 'carlos.barrios89@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001631', 'Silvia', 'Hernández', 'silvia.hernández90@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001648', 'Ramiro', 'Mejía', 'ramiro.mejía91@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001665', 'Sonia', 'Guzmán', 'sonia.guzmán92@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001682', 'Alejandro', 'Guzmán', 'alejandro.guzmán93@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001699', 'Oscar', 'Reyes', 'oscar.reyes94@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001716', 'Pedro', 'Díaz', 'pedro.díaz95@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001733', 'Eduardo', 'González', 'eduardo.gonzález96@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001750', 'Mario', 'López', 'mario.lópez97@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001767', 'Silvia', 'Mejía', 'silvia.mejía98@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001784', 'Silvia', 'Gómez', 'silvia.gómez99@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001801', 'Mariana', 'Guzmán', 'mariana.guzmán100@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001818', 'Fernando', 'Fuentes', 'fernando.fuentes101@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001835', 'Sofía', 'Pineda', 'sofía.pineda102@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001852', 'Lorena', 'Díaz', 'lorena.díaz103@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001869', 'Lorena', 'Fuentes', 'lorena.fuentes104@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001886', 'Patricia', 'Rodríguez', 'patricia.rodríguez105@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001903', 'Diego', 'Vásquez', 'diego.vásquez106@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001920', 'Teresa', 'González', 'teresa.gonzález107@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001937', 'Sonia', 'Guzmán', 'sonia.guzmán108@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001954', 'Francisco', 'Alvarado', 'francisco.alvarado109@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001971', 'Carlos', 'Estrada', 'carlos.estrada110@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100001988', 'Gabriela', 'Girón', 'gabriela.girón111@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002005', 'Ana', 'Hernández', 'ana.hernández112@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002022', 'Javier', 'Mejía', 'javier.mejía113@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002039', 'Manuel', 'Martínez', 'manuel.martínez114@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002056', 'María', 'Martínez', 'maría.martínez115@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002073', 'Claudia', 'Morales', 'claudia.morales116@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002090', 'Juan', 'Mérida', 'juan.mérida117@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002107', 'Roberto', 'Cabrera', 'roberto.cabrera118@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002124', 'José', 'Guzmán', 'josé.guzmán119@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002141', 'Sonia', 'Guzmán', 'sonia.guzmán120@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002158', 'Lucía', 'Pérez', 'lucía.pérez121@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002175', 'Alicia', 'Girón', 'alicia.girón122@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002192', 'Gustavo', 'González', 'gustavo.gonzález123@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002209', 'Daniela', 'Fuentes', 'daniela.fuentes124@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002226', 'Patricia', 'Mendoza', 'patricia.mendoza125@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002243', 'Jorge', 'Alvarado', 'jorge.alvarado126@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002260', 'Sonia', 'Guzmán', 'sonia.guzmán127@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002277', 'Silvia', 'Chávez', 'silvia.chávez128@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002294', 'Valeria', 'Chávez', 'valeria.chávez129@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002311', 'Manuel', 'Castillo', 'manuel.castillo130@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002328', 'Alicia', 'Rios', 'alicia.rios131@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002345', 'Javier', 'Aguilar', 'javier.aguilar132@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002362', 'Francisco', 'Aguilar', 'francisco.aguilar133@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002379', 'Pedro', 'Martínez', 'pedro.martínez134@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002396', 'Paola', 'Morales', 'paola.morales135@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002413', 'Ricardo', 'López', 'ricardo.lópez136@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002430', 'Hector', 'Cifuentes', 'hector.cifuentes137@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002447', 'Paola', 'Salazar', 'paola.salazar138@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002464', 'Paola', 'López', 'paola.lópez139@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002481', 'José', 'Chávez', 'josé.chávez140@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002498', 'Lorena', 'García', 'lorena.garcía141@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002515', 'Paola', 'Morales', 'paola.morales142@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002532', 'Luis', 'Pineda', 'luis.pineda143@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002549', 'Ricardo', 'Morales', 'ricardo.morales144@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002566', 'Mariana', 'Martínez', 'mariana.martínez145@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002583', 'Alejandro', 'Barrios', 'alejandro.barrios146@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002600', 'Roberto', 'Rodríguez', 'roberto.rodríguez147@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002617', 'Sonia', 'Pérez', 'sonia.pérez148@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002634', 'Silvia', 'Alvarado', 'silvia.alvarado149@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002651', 'Claudia', 'Salazar', 'claudia.salazar150@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002668', 'Adriana', 'Martínez', 'adriana.martínez151@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002685', 'Adriana', 'Juárez', 'adriana.juárez152@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002702', 'Isabel', 'Rodríguez', 'isabel.rodríguez153@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002719', 'Sofía', 'Hernández', 'sofía.hernández154@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002736', 'Alicia', 'Mendoza', 'alicia.mendoza155@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002753', 'Fernanda', 'Mendoza', 'fernanda.mendoza156@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002770', 'Isabel', 'Aguilar', 'isabel.aguilar157@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002787', 'Silvia', 'García', 'silvia.garcía158@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002804', 'Ramiro', 'Rios', 'ramiro.rios159@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002821', 'Oscar', 'Hernández', 'oscar.hernández160@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002838', 'María', 'Castillo', 'maría.castillo161@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002855', 'Silvia', 'Reyes', 'silvia.reyes162@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002872', 'Sofía', 'Martínez', 'sofía.martínez163@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002889', 'Valeria', 'Rodríguez', 'valeria.rodríguez164@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002906', 'Sonia', 'Aguilar', 'sonia.aguilar165@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002923', 'Lucía', 'Mendoza', 'lucía.mendoza166@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002940', 'Fernando', 'Gómez', 'fernando.gómez167@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002957', 'Mario', 'Martínez', 'mario.martínez168@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002974', 'José', 'Aguilar', 'josé.aguilar169@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100002991', 'Gustavo', 'Hernández', 'gustavo.hernández170@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003008', 'María', 'Rios', 'maría.rios171@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003025', 'Sonia', 'Cabrera', 'sonia.cabrera172@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003042', 'Carlos', 'Morales', 'carlos.morales173@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003059', 'Teresa', 'Pineda', 'teresa.pineda174@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003076', 'Miguel', 'González', 'miguel.gonzález175@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003093', 'Isabel', 'Girón', 'isabel.girón176@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003110', 'Adriana', 'Rodríguez', 'adriana.rodríguez177@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003127', 'Rodrigo', 'Mejía', 'rodrigo.mejía178@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003144', 'María', 'González', 'maría.gonzález179@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003161', 'Elena', 'López', 'elena.lópez180@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003178', 'Elena', 'Gómez', 'elena.gómez181@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003195', 'Mario', 'Díaz', 'mario.díaz182@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003212', 'Eduardo', 'Chávez', 'eduardo.chávez183@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003229', 'Silvia', 'Juárez', 'silvia.juárez184@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003246', 'Gustavo', 'Barrios', 'gustavo.barrios185@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003263', 'Arturo', 'Girón', 'arturo.girón186@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003280', 'Diego', 'Rodríguez', 'diego.rodríguez187@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003297', 'Camila', 'Rodríguez', 'camila.rodríguez188@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003314', 'María', 'Salazar', 'maría.salazar189@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003331', 'Raul', 'Cifuentes', 'raul.cifuentes190@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003348', 'María', 'Mérida', 'maría.mérida191@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003365', 'Gabriela', 'García', 'gabriela.garcía192@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003382', 'María', 'Salazar', 'maría.salazar193@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003399', 'Adriana', 'Fuentes', 'adriana.fuentes194@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003416', 'Francisco', 'González', 'francisco.gonzález195@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003433', 'María', 'Fuentes', 'maría.fuentes196@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003450', 'Juan', 'Pineda', 'juan.pineda197@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003467', 'Fernando', 'Morales', 'fernando.morales198@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003484', 'Patricia', 'Morales', 'patricia.morales199@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003501', 'Ramiro', 'Pineda', 'ramiro.pineda200@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003518', 'Miguel', 'Castillo', 'miguel.castillo201@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003535', 'Pedro', 'Mejía', 'pedro.mejía202@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003552', 'Claudia', 'Martínez', 'claudia.martínez203@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003569', 'Hector', 'Estrada', 'hector.estrada204@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003586', 'Luis', 'Estrada', 'luis.estrada205@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003603', 'Juan', 'Mendoza', 'juan.mendoza206@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003620', 'Alicia', 'Salazar', 'alicia.salazar207@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003637', 'Claudia', 'Fuentes', 'claudia.fuentes208@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003654', 'Gabriela', 'Alvarado', 'gabriela.alvarado209@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003671', 'Daniela', 'Rodríguez', 'daniela.rodríguez210@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003688', 'Alicia', 'Chávez', 'alicia.chávez211@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003705', 'Gabriela', 'Martínez', 'gabriela.martínez212@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003722', 'Daniela', 'Castillo', 'daniela.castillo213@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003739', 'Lucía', 'Barrios', 'lucía.barrios214@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003756', 'Oscar', 'Díaz', 'oscar.díaz215@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003773', 'Mario', 'Reyes', 'mario.reyes216@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003790', 'Teresa', 'Alvarado', 'teresa.alvarado217@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003807', 'José', 'López', 'josé.lópez218@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003824', 'Mario', 'Estrada', 'mario.estrada219@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003841', 'Claudia', 'Hernández', 'claudia.hernández220@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003858', 'José', 'Cifuentes', 'josé.cifuentes221@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003875', 'Jorge', 'Fuentes', 'jorge.fuentes222@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003892', 'Daniela', 'Pérez', 'daniela.pérez223@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003909', 'Fernanda', 'Mejía', 'fernanda.mejía224@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003926', 'José', 'Mejía', 'josé.mejía225@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003943', 'Miguel', 'Vásquez', 'miguel.vásquez226@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003960', 'Camila', 'González', 'camila.gonzález227@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003977', 'Beatriz', 'Cabrera', 'beatriz.cabrera228@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100003994', 'Sonia', 'Chávez', 'sonia.chávez229@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004011', 'Manuel', 'Estrada', 'manuel.estrada230@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004028', 'Oscar', 'Fuentes', 'oscar.fuentes231@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004045', 'Carlos', 'Barrios', 'carlos.barrios232@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004062', 'Gustavo', 'Díaz', 'gustavo.díaz233@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004079', 'Alicia', 'Hernández', 'alicia.hernández234@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004096', 'Lucía', 'Gómez', 'lucía.gómez235@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004113', 'Pedro', 'Mejía', 'pedro.mejía236@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004130', 'Sofía', 'Mérida', 'sofía.mérida237@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004147', 'Gustavo', 'Pérez', 'gustavo.pérez238@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004164', 'Alejandro', 'Díaz', 'alejandro.díaz239@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004181', 'Patricia', 'Rodríguez', 'patricia.rodríguez240@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004198', 'Arturo', 'Reyes', 'arturo.reyes241@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004215', 'Jorge', 'Barrios', 'jorge.barrios242@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004232', 'Lorena', 'Pineda', 'lorena.pineda243@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004249', 'Daniela', 'Fuentes', 'daniela.fuentes244@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004266', 'Roberto', 'Gómez', 'roberto.gómez245@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004283', 'María', 'Morales', 'maría.morales246@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004300', 'Lorena', 'Mendoza', 'lorena.mendoza247@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004317', 'Alejandro', 'García', 'alejandro.garcía248@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004334', 'Carlos', 'Reyes', 'carlos.reyes249@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004351', 'Gonzalo', 'Pérez', 'gonzalo.pérez250@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004368', 'Lorena', 'Gómez', 'lorena.gómez251@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004385', 'Andrea', 'Mérida', 'andrea.mérida252@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004402', 'Beatriz', 'Cifuentes', 'beatriz.cifuentes253@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004419', 'Arturo', 'Mendoza', 'arturo.mendoza254@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004436', 'Gustavo', 'López', 'gustavo.lópez255@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004453', 'Pedro', 'Morales', 'pedro.morales256@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004470', 'Monica', 'Mejía', 'monica.mejía257@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004487', 'Diego', 'Cifuentes', 'diego.cifuentes258@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004504', 'Luis', 'Cabrera', 'luis.cabrera259@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004521', 'Javier', 'Salazar', 'javier.salazar260@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004538', 'Gustavo', 'Pérez', 'gustavo.pérez261@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004555', 'Eduardo', 'Pérez', 'eduardo.pérez262@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004572', 'Luis', 'Díaz', 'luis.díaz263@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004589', 'Javier', 'Mejía', 'javier.mejía264@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004606', 'Luis', 'Mejía', 'luis.mejía265@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004623', 'Fernanda', 'Rodríguez', 'fernanda.rodríguez266@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004640', 'Ramiro', 'Martínez', 'ramiro.martínez267@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004657', 'Alicia', 'Hernández', 'alicia.hernández268@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004674', 'Fernanda', 'Guzmán', 'fernanda.guzmán269@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004691', 'Gustavo', 'Mejía', 'gustavo.mejía270@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004708', 'Isabel', 'Estrada', 'isabel.estrada271@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004725', 'Raul', 'Pérez', 'raul.pérez272@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004742', 'Miguel', 'Pineda', 'miguel.pineda273@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004759', 'Andrea', 'Juárez', 'andrea.juárez274@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004776', 'Fernando', 'Mejía', 'fernando.mejía275@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004793', 'Isabel', 'López', 'isabel.lópez276@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004810', 'Fernando', 'Mérida', 'fernando.mérida277@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004827', 'Ricardo', 'Juárez', 'ricardo.juárez278@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004844', 'Isabel', 'Juárez', 'isabel.juárez279@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004861', 'Alicia', 'Pineda', 'alicia.pineda280@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004878', 'Raul', 'Juárez', 'raul.juárez281@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004895', 'Miguel', 'Gómez', 'miguel.gómez282@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004912', 'Andrea', 'Juárez', 'andrea.juárez283@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004929', 'Monica', 'Hernández', 'monica.hernández284@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004946', 'Elena', 'Pineda', 'elena.pineda285@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004963', 'Luis', 'Pineda', 'luis.pineda286@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004980', 'Adriana', 'Martínez', 'adriana.martínez287@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100004997', 'Valeria', 'Cabrera', 'valeria.cabrera288@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005014', 'Mario', 'Vásquez', 'mario.vásquez289@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005031', 'Manuel', 'Cabrera', 'manuel.cabrera290@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005048', 'Paola', 'Martínez', 'paola.martínez291@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005065', 'Ana', 'Barrios', 'ana.barrios292@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005082', 'Valeria', 'Castillo', 'valeria.castillo293@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005099', 'Ricardo', 'Gómez', 'ricardo.gómez294@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005116', 'José', 'Guzmán', 'josé.guzmán295@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005133', 'Alejandro', 'Vásquez', 'alejandro.vásquez296@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005150', 'Oscar', 'Fuentes', 'oscar.fuentes297@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005167', 'Rodrigo', 'Barrios', 'rodrigo.barrios298@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005184', 'Sonia', 'Reyes', 'sonia.reyes299@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005201', 'Ana', 'Hernández', 'ana.hernández300@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005218', 'Daniela', 'González', 'daniela.gonzález301@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005235', 'Hector', 'Gómez', 'hector.gómez302@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005252', 'Luis', 'Hernández', 'luis.hernández303@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005269', 'Patricia', 'Mendoza', 'patricia.mendoza304@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005286', 'Fernanda', 'Mérida', 'fernanda.mérida305@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005303', 'Gabriela', 'Mendoza', 'gabriela.mendoza306@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005320', 'Patricia', 'Fuentes', 'patricia.fuentes307@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005337', 'Pedro', 'Castillo', 'pedro.castillo308@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005354', 'Claudia', 'Rodríguez', 'claudia.rodríguez309@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005371', 'Daniela', 'García', 'daniela.garcía310@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005388', 'Arturo', 'Mendoza', 'arturo.mendoza311@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005405', 'Carlos', 'Fuentes', 'carlos.fuentes312@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005422', 'Sonia', 'Barrios', 'sonia.barrios313@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005439', 'Silvia', 'Mérida', 'silvia.mérida314@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005456', 'Raul', 'Barrios', 'raul.barrios315@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005473', 'Valeria', 'Vásquez', 'valeria.vásquez316@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005490', 'Eduardo', 'Morales', 'eduardo.morales317@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005507', 'Alicia', 'Alvarado', 'alicia.alvarado318@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005524', 'Ricardo', 'Estrada', 'ricardo.estrada319@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005541', 'Gabriela', 'Barrios', 'gabriela.barrios320@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005558', 'Pedro', 'Mérida', 'pedro.mérida321@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005575', 'Manuel', 'Fuentes', 'manuel.fuentes322@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005592', 'Manuel', 'Barrios', 'manuel.barrios323@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005609', 'Isabel', 'Reyes', 'isabel.reyes324@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005626', 'Rodrigo', 'Chávez', 'rodrigo.chávez325@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005643', 'Camila', 'Cifuentes', 'camila.cifuentes326@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005660', 'Lucía', 'Rodríguez', 'lucía.rodríguez327@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005677', 'Isabel', 'Barrios', 'isabel.barrios328@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005694', 'Elena', 'Barrios', 'elena.barrios329@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005711', 'Raul', 'Mejía', 'raul.mejía330@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005728', 'Fernando', 'Estrada', 'fernando.estrada331@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005745', 'Claudia', 'Díaz', 'claudia.díaz332@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005762', 'Rodrigo', 'Cifuentes', 'rodrigo.cifuentes333@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005779', 'Carlos', 'Díaz', 'carlos.díaz334@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005796', 'Camila', 'Rodríguez', 'camila.rodríguez335@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005813', 'Eduardo', 'Juárez', 'eduardo.juárez336@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005830', 'Hector', 'Estrada', 'hector.estrada337@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005847', 'Oscar', 'Reyes', 'oscar.reyes338@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005864', 'Mario', 'Aguilar', 'mario.aguilar339@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005881', 'Beatriz', 'Barrios', 'beatriz.barrios340@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005898', 'Jorge', 'Fuentes', 'jorge.fuentes341@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005915', 'Adriana', 'Juárez', 'adriana.juárez342@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005932', 'Raul', 'González', 'raul.gonzález343@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005949', 'Alicia', 'Morales', 'alicia.morales344@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005966', 'Camila', 'Fuentes', 'camila.fuentes345@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100005983', 'Alicia', 'Rios', 'alicia.rios346@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006000', 'Sergio', 'Reyes', 'sergio.reyes347@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006017', 'Juan', 'Cabrera', 'juan.cabrera348@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006034', 'Teresa', 'Martínez', 'teresa.martínez349@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006051', 'Ramiro', 'Díaz', 'ramiro.díaz350@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006068', 'Paola', 'Juárez', 'paola.juárez351@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006085', 'Valeria', 'Pérez', 'valeria.pérez352@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006102', 'Ana', 'García', 'ana.garcía353@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006119', 'Miguel', 'Girón', 'miguel.girón354@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006136', 'Sergio', 'Pineda', 'sergio.pineda355@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006153', 'Gonzalo', 'Morales', 'gonzalo.morales356@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006170', 'Mario', 'Mendoza', 'mario.mendoza357@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006187', 'Lorena', 'Salazar', 'lorena.salazar358@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006204', 'Valeria', 'Chávez', 'valeria.chávez359@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006221', 'Monica', 'Castillo', 'monica.castillo360@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006238', 'Roberto', 'Castillo', 'roberto.castillo361@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006255', 'Miguel', 'Pérez', 'miguel.pérez362@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006272', 'Oscar', 'Chávez', 'oscar.chávez363@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006289', 'Carlos', 'Mejía', 'carlos.mejía364@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006306', 'Teresa', 'Pineda', 'teresa.pineda365@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006323', 'Gonzalo', 'Mejía', 'gonzalo.mejía366@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006340', 'Sofía', 'Guzmán', 'sofía.guzmán367@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006357', 'Eduardo', 'Martínez', 'eduardo.martínez368@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006374', 'Fernando', 'Juárez', 'fernando.juárez369@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006391', 'Monica', 'Fuentes', 'monica.fuentes370@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006408', 'Mario', 'García', 'mario.garcía371@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006425', 'Gustavo', 'Martínez', 'gustavo.martínez372@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006442', 'Pedro', 'Aguilar', 'pedro.aguilar373@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006459', 'Lucía', 'Juárez', 'lucía.juárez374@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006476', 'Mario', 'Barrios', 'mario.barrios375@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006493', 'Francisco', 'Cifuentes', 'francisco.cifuentes376@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006510', 'Patricia', 'Reyes', 'patricia.reyes377@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006527', 'Teresa', 'Mejía', 'teresa.mejía378@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006544', 'Beatriz', 'Estrada', 'beatriz.estrada379@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006561', 'Silvia', 'Mejía', 'silvia.mejía380@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006578', 'Mariana', 'Mendoza', 'mariana.mendoza381@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006595', 'Gustavo', 'Aguilar', 'gustavo.aguilar382@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006612', 'Andrea', 'Mérida', 'andrea.mérida383@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006629', 'Adriana', 'Aguilar', 'adriana.aguilar384@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006646', 'Daniela', 'Guzmán', 'daniela.guzmán385@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006663', 'Miguel', 'Cabrera', 'miguel.cabrera386@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006680', 'Lorena', 'Gómez', 'lorena.gómez387@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006697', 'Gonzalo', 'Guzmán', 'gonzalo.guzmán388@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006714', 'Francisco', 'Girón', 'francisco.girón389@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006731', 'Lorena', 'Martínez', 'lorena.martínez390@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006748', 'Alejandro', 'Aguilar', 'alejandro.aguilar391@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006765', 'José', 'Chávez', 'josé.chávez392@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006782', 'Camila', 'Martínez', 'camila.martínez393@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006799', 'Alejandro', 'Reyes', 'alejandro.reyes394@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006816', 'Gabriela', 'Mejía', 'gabriela.mejía395@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006833', 'Sonia', 'Morales', 'sonia.morales396@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006850', 'Lucía', 'Pérez', 'lucía.pérez397@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006867', 'Paola', 'Castillo', 'paola.castillo398@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006884', 'Monica', 'Pérez', 'monica.pérez399@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006901', 'Arturo', 'Rodríguez', 'arturo.rodríguez400@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006918', 'José', 'Mendoza', 'josé.mendoza401@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006935', 'Isabel', 'Reyes', 'isabel.reyes402@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006952', 'Sonia', 'Aguilar', 'sonia.aguilar403@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006969', 'Isabel', 'García', 'isabel.garcía404@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100006986', 'Jorge', 'Cabrera', 'jorge.cabrera405@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007003', 'Isabel', 'Castillo', 'isabel.castillo406@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007020', 'Gonzalo', 'Salazar', 'gonzalo.salazar407@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007037', 'Monica', 'López', 'monica.lópez408@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007054', 'Teresa', 'Salazar', 'teresa.salazar409@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007071', 'Elena', 'Girón', 'elena.girón410@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007088', 'Carlos', 'Vásquez', 'carlos.vásquez411@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007105', 'Manuel', 'Guzmán', 'manuel.guzmán412@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007122', 'Elena', 'Pineda', 'elena.pineda413@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007139', 'Isabel', 'Cifuentes', 'isabel.cifuentes414@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007156', 'Raul', 'Mérida', 'raul.mérida415@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007173', 'Sonia', 'Juárez', 'sonia.juárez416@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007190', 'Patricia', 'Mejía', 'patricia.mejía417@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007207', 'Paola', 'Girón', 'paola.girón418@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007224', 'Paola', 'Gómez', 'paola.gómez419@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007241', 'Eduardo', 'Girón', 'eduardo.girón420@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007258', 'Ana', 'Castillo', 'ana.castillo421@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007275', 'Ricardo', 'Barrios', 'ricardo.barrios422@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007292', 'Ramiro', 'Juárez', 'ramiro.juárez423@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007309', 'Rodrigo', 'Mérida', 'rodrigo.mérida424@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007326', 'Andrea', 'Cabrera', 'andrea.cabrera425@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007343', 'Mario', 'Alvarado', 'mario.alvarado426@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007360', 'Lucía', 'Estrada', 'lucía.estrada427@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007377', 'Sonia', 'López', 'sonia.lópez428@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007394', 'Rodrigo', 'Salazar', 'rodrigo.salazar429@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007411', 'Claudia', 'Barrios', 'claudia.barrios430@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007428', 'Ana', 'Morales', 'ana.morales431@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007445', 'Oscar', 'Mendoza', 'oscar.mendoza432@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007462', 'Lucía', 'Pineda', 'lucía.pineda433@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007479', 'Mario', 'González', 'mario.gonzález434@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007496', 'María', 'Gómez', 'maría.gómez435@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007513', 'Elena', 'Reyes', 'elena.reyes436@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007530', 'Jorge', 'Aguilar', 'jorge.aguilar437@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007547', 'Gabriela', 'Reyes', 'gabriela.reyes438@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007564', 'Teresa', 'Mejía', 'teresa.mejía439@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007581', 'Elena', 'Gómez', 'elena.gómez440@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007598', 'Teresa', 'Cabrera', 'teresa.cabrera441@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007615', 'Isabel', 'Gómez', 'isabel.gómez442@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007632', 'Juan', 'Girón', 'juan.girón443@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007649', 'Ana', 'Mérida', 'ana.mérida444@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007666', 'Sonia', 'García', 'sonia.garcía445@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007683', 'Fernanda', 'Martínez', 'fernanda.martínez446@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007700', 'Oscar', 'Morales', 'oscar.morales447@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007717', 'Gonzalo', 'Rios', 'gonzalo.rios448@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007734', 'Luis', 'Guzmán', 'luis.guzmán449@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007751', 'Ana', 'Martínez', 'ana.martínez450@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007768', 'Valeria', 'Cabrera', 'valeria.cabrera451@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007785', 'Ana', 'Estrada', 'ana.estrada452@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007802', 'Diego', 'Martínez', 'diego.martínez453@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007819', 'Lucía', 'Girón', 'lucía.girón454@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007836', 'Alicia', 'Hernández', 'alicia.hernández455@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007853', 'Claudia', 'Rodríguez', 'claudia.rodríguez456@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007870', 'Mario', 'Chávez', 'mario.chávez457@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007887', 'Daniela', 'Guzmán', 'daniela.guzmán458@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007904', 'Javier', 'González', 'javier.gonzález459@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007921', 'Patricia', 'Estrada', 'patricia.estrada460@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007938', 'Raul', 'Chávez', 'raul.chávez461@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007955', 'Pedro', 'Guzmán', 'pedro.guzmán462@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007972', 'Andrea', 'Díaz', 'andrea.díaz463@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100007989', 'Sofía', 'Salazar', 'sofía.salazar464@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008006', 'Ana', 'Alvarado', 'ana.alvarado465@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008023', 'Manuel', 'Salazar', 'manuel.salazar466@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008040', 'Ramiro', 'Alvarado', 'ramiro.alvarado467@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008057', 'Elena', 'Castillo', 'elena.castillo468@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008074', 'Arturo', 'Rodríguez', 'arturo.rodríguez469@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008091', 'José', 'Salazar', 'josé.salazar470@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008108', 'Monica', 'Cabrera', 'monica.cabrera471@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008125', 'Lorena', 'Martínez', 'lorena.martínez472@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008142', 'Sofía', 'Chávez', 'sofía.chávez473@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008159', 'Gonzalo', 'Díaz', 'gonzalo.díaz474@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008176', 'Ramiro', 'Estrada', 'ramiro.estrada475@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008193', 'Pedro', 'Juárez', 'pedro.juárez476@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008210', 'Claudia', 'Juárez', 'claudia.juárez477@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008227', 'Luis', 'Vásquez', 'luis.vásquez478@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008244', 'Sonia', 'Mendoza', 'sonia.mendoza479@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008261', 'Alicia', 'Vásquez', 'alicia.vásquez480@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008278', 'José', 'Fuentes', 'josé.fuentes481@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008295', 'Oscar', 'Reyes', 'oscar.reyes482@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008312', 'Carlos', 'Pineda', 'carlos.pineda483@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008329', 'Isabel', 'Cabrera', 'isabel.cabrera484@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008346', 'Roberto', 'Hernández', 'roberto.hernández485@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008363', 'Eduardo', 'Vásquez', 'eduardo.vásquez486@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008380', 'Lorena', 'Mejía', 'lorena.mejía487@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008397', 'Mario', 'Chávez', 'mario.chávez488@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008414', 'Diego', 'Mendoza', 'diego.mendoza489@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008431', 'Fernando', 'Mérida', 'fernando.mérida490@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008448', 'Francisco', 'Rios', 'francisco.rios491@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008465', 'Alejandro', 'Estrada', 'alejandro.estrada492@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008482', 'Sonia', 'Guzmán', 'sonia.guzmán493@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008499', 'Adriana', 'Aguilar', 'adriana.aguilar494@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008516', 'Eduardo', 'Cabrera', 'eduardo.cabrera495@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008533', 'Silvia', 'Salazar', 'silvia.salazar496@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008550', 'Alejandro', 'Reyes', 'alejandro.reyes497@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008567', 'Miguel', 'Cabrera', 'miguel.cabrera498@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008584', 'Juan', 'Gómez', 'juan.gómez499@correo.com');
INSERT INTO Operaciones.Clientes (DPI, Nombres, Apellidos, Correo) VALUES ('2540100008601', 'Beatriz', 'Martínez', 'beatriz.martínez500@correo.com');
GO

-- =========================================================
-- PARTE A3: BULK INSERT (Desde archivo plano)
-- =========================================================
DROP TABLE IF EXISTS #TmpCreditos;

CREATE TABLE #TmpCreditos (
    IdCredito INT,
    IdCliente INT,
    IdVehiculo INT,
    MontoCapital DECIMAL(12,2),
    TasaInteresMensual DECIMAL(5,2),
    Estado VARCHAR(20),
    FechaDesembolso DATE
);

-- Cargar archivo plano
BULK INSERT #TmpCreditos
FROM '/tmp/prestamos.txt'
WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0a',
    FIRSTROW = 1
);

-- Limpiar tabla principal e insertar datos
TRUNCATE TABLE Operaciones.Creditos;

INSERT INTO Operaciones.Creditos (IdCliente, IdVehiculo, MontoCapital, TasaInteresMensual, Estado, FechaDesembolso)
SELECT IdCliente, IdVehiculo, MontoCapital, TasaInteresMensual, Estado, FechaDesembolso
FROM #TmpCreditos;

DROP TABLE #TmpCreditos;
GO

-- =========================================================
-- PARTE B: INTELIGENCIA FINANCIERA (REPORTES SEGUNDO GUÍA)
-- =========================================================

-- Reporte 1: Riesgo Acumulado (SUM de Capital y AVG de Tasa por Estado)
SELECT 
    Estado,
    SUM(MontoCapital) AS TotalCapitalPrestado,
    AVG(TasaInteresMensual) AS TasaInteresPromedio
FROM Operaciones.Creditos
GROUP BY Estado;

-- Reporte 2: Concentración Vehicular (COUNT préstamos por Marca del Vehículo con HAVING > 50)
SELECT 
    V.Marca,
    COUNT(C.IdCredito) AS TotalPrestamos
FROM Operaciones.Creditos C
INNER JOIN Garantias.Vehiculos V ON C.IdVehiculo = V.IdVehiculo
GROUP BY V.Marca
HAVING COUNT(C.IdCredito) > 50;

-- Reporte 3: Análisis de Extremos (Préstamo MAX y MIN)
SELECT 
    MAX(MontoCapital) AS PrestamoMaximoHistorico,
    MIN(MontoCapital) AS PrestamoMinimoHistorico
FROM Operaciones.Creditos;

-- Conteo de Verificación de Vehículos
SELECT COUNT(*) AS TotalVehiculos FROM Garantias.Vehiculos;

-- Conteo de Verificación
SELECT COUNT(*) AS TotalRegistros FROM Operaciones.Creditos;

-- Muestra de 10 líneas del archivo plano (prestamos.txt)
--1|1|6639.00|2.20|Activo--
--2|2|11717.00|1.80|Atrasado--
--3|1|6952.00|1.80|Activo--
--4|5|44453.00|1.50|Atrasado--
--5|5|32493.00|2.10|Activo--
--6|3|5425.00|2.00|Atrasado--
--7|3|23210.00|2.00|Activo--
--8|3|11698.00|1.80|Activo--
--9|3|27541.00|2.20|Pagado--
--10|4|40142.00|1.80|Pagado--


