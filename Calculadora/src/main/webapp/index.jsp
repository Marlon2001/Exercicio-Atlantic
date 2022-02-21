<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	String resultado = "";
	String mensagem = "";

	try {
		String campoa = request.getParameter("campoa");
		String campob = request.getParameter("campob");
		String operacao = request.getParameter("operacao");
		
		if((campoa != null && campob != null) && (operacao != null)) {
			if(campoa.isEmpty() || campob.isEmpty()) {
				mensagem = "Digite os números para fazer a conta.";
			} else {
				int a = Integer.valueOf(campoa);
				int b = Integer.valueOf(campob);
				
				resultado = "O Resultado é: ";
				if(operacao.equals("Somar")) {
					resultado += a + b;
				} else if(operacao.equals("Subtrair")) {
					resultado += a - b;
				}
			}
		}
	} catch (NumberFormatException e) {
		mensagem = "Digite apenas números!";
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Calculadora</title>
        <style>
		   body {
		       display: flex;
		       padding: 0px;
		       margin: 0px;
		   }
		
		   .container {
		       width: 400px;
		       height: 350px;
		       border: 3px solid black;
		       display: inline-block;
		       margin-left: auto;
		       margin-right: auto;
		       margin-top: 50px;
		   }
		
		   .campos {
		       height: 100px;
		       width: 100%;
		       text-align: center;
		       align-content: center;
		       box-sizing: border-box;
		       padding: 15px;
		       font-size: 18px;
		   }
		
		   .operacoes {
		       height: 75px;
		       width: 100%;
		       text-align: center;
		       align-content: center;
		       box-sizing: border-box;
		       padding: 15px;
		       font-size: 18px;
		   }
		
		   .texto {
		       height: 32px;
		       width: 100%;
		       text-align: left;
		       box-sizing: border-box;
		       padding: 15px;
		       font-size: 18px;
		   }
		</style>
    </head>
    <body>
        <form method="post" class="container">
            <div class="campos">
                <label for="campoa">Campo A</label><br>
                <input type="text" name="campoa">
            </div>
            <div class="campos">
                <label for="campob">Campo B</label><br>
                <input type="text" name="campob">
            </div>
            <div class="operacoes">
                <input type="submit" name="operacao" value="Somar" />
                <input type="submit" name="operacao" value="Subtrair" />
            </div>
            <div class="texto">
                <%= resultado %>
            </div>
            <div class="texto">
				<%= mensagem %>
            </div>
        </form>
    </body>
</html>