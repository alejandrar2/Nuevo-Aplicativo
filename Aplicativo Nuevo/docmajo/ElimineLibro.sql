CREATE PROCEDURE SP_REMOVE_LIBRO( @idLibro INT, @PcMensaje INT OUTPUT)
AS
BEGIN 
    DECLARE @conteo INT;
	DECLARE @mensajeError VARCHAR(2000);
	SET @PcMensaje=0;
	SET @conteo=0;
	SET @mensajeError='';

/*======================================================================================*/
	IF @idLibro='' or @idLibro IS NULL BEGIN 
		SET @mensajeError=@mensajeError+CONVERT(varchar,'ID del libro');
	END


	/*======================================================================================*/

	SELECT @conteo=COUNT(*) FROM libro WHERE idLibro= @idLibro; 

	IF @mensajeError='' AND @conteo > 0 BEGIN 
		
		DELETE FROM libro WHERE idLibro=@idLibro;
		SET @PcMensaje=1;
	END
	ELSE 
		BEGIN
		SET @PcMensaje=0;
	END
END
