
CREATE PROCEDURE SP_EDITE_LIBRO( @idLibro INT, @nombre VARCHAR(50), @edicion VARCHAR(50), @prestar SMALLINT, @precio FLOAT, @PcMensaje INT OUTPUT)
AS
BEGIN 
    DECLARE @conteo INT;
	DECLARE @mensajeError VARCHAR(2000);
	SET @PcMensaje=0;
	SET @conteo=0;
	SET @mensajeError='';

/*======================================================================================*/
	IF @nombre='' or @nombre IS NULL BEGIN 
		SET @mensajeError=@mensajeError+CONVERT(varchar,'nombre,');
	END

	IF @edicion='' or @edicion IS NULL BEGIN 
		SET @mensajeError=@mensajeError+CONVERT(varchar,'edicion,');
	END

	IF @prestar IS NULL BEGIN 
		SET @mensajeError=@mensajeError+CONVERT(varchar,'prestar,');
	END

	IF @precio=0 or @precio IS NULL BEGIN 
		SET @mensajeError=@mensajeError+CONVERT(varchar,'precio,');
	END

	/*======================================================================================*/

	SELECT @conteo=COUNT(*) FROM libro WHERE idLibro= @idLibro; 

	IF @mensajeError='' AND @conteo > 0 BEGIN 
		
		UPDATE libro SET nombre = @nombre,edicion= @edicion,prestar=@prestar,precio=@precio WHERE idLibro=@idLibro;
		SET @PcMensaje=1;
	END
	ELSE 
		BEGIN
		SET @PcMensaje=0;
	END
END
