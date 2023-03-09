<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="Versión_Final.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!---  Link de Bootstrap y JQuery --> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>                                                                          
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
   
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>

     <!---  Link del CSS que nosotros creamos --> 

    <link href="Recursos/CSS/Estilos.css" rel="stylesheet" />

    <title>Bienvenido</title>
</head>
<body class="form-control bg-light">
    <div class="container small">
         <div class="row">
             <div class="col"></div>
    <form id="form1" runat="server">

        <div>
            <asp:Label ID="lblBienvenida" runat="server" Text="" CssClass="h3"></asp:Label>
        </div>
        <div>
            <!-- Onclick = BtnCerrar_Click para luego crearlo en eventos-->
            <asp:Button ID="BtnCerrar" runat="server" Text="Cerrar Sesion" CssClass="btn btn-dark" OnClick="BtnCerrar_Click"/>
        </div>
        <h2 class="text-center">Datos de empleados</h2>
                 <div>
                     <fieldset>
                         <legend>Datos de empleado</legend>

                         <asp:Table runat="server">
                              <asp:TableRow>
                                  <asp:TableCell>
                                        <asp:Label runat="server" ID="lblNombres" Text="Nombre:"></asp:Label>
                                    </asp:TableCell>

                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="nombres" placeholder="Manuel"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                             <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblApellidos" Text="Apellido:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="apellidos" placeholder="Moreno"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                             <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="LblIdentificacion" Text="Identificacion:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="identificacion" placeholder="1000"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                             <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="LblDireccion" Text="Direccion:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="direccion" placeholder="calle 5"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>


                              <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="LblSalario" Text="Salario:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="salario" placeholder="COP"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                        
                         </asp:Table>
                         <br />
                     </fieldset>
                     <div>
                         <asp:Button ID="BtnIngresar" Text="Registrar" CssClass="btn btn-dark btn-primary" OnClick="BtnIngresar_clic" runat="server"/>
                     </div>
                         <div>
                         <asp:Button ID="Btnexportar" Text="Excel" CssClass="btn btn-dark btn-primary" OnClick="BtnExportar_clic" runat="server"/>
                     </div>

                 </div>
    </form>
            <div class="col">
                <fieldset>
                    <legend>Registros existentes</legend>
                </fieldset>
                <br />
                <div>
                <asp:DataGrid runat="server" ID="empleado" CssClass="table"></asp:DataGrid>
            </div>

             

        </div>


        <div>
        </div>

</body>
</html>
