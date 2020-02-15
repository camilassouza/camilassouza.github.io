'----------------------------------------Variáveis----------------------------------------
response.Charset = "utf-8" 
response.ContentType = "text/html"
Nome = Request.form("nome")
Email = Request.form("mensagem")
Telefone = Request.form("telefone")
'----------------------------------------Variáveis----------------------------------------



'----------------------------------------Enviar e-mail----------------------------------------
On error resume next
mensagem = _
"Nome: " & Nome & "<br>" &_
"mensagem: " & mensagem & "<br>" &_
"Telefone: " & Telefone & "<br>" &_
"utm_source: " & utm_source & "<br>" &_
"utm_medium: " & utm_medium & "<br>" &_
"utm_campaign: " & utm_campaign & "<br>" &_
"utm_term: " & utm_term & "<br>" &_
"utm_content: " & utm_content & "<br>"
Set objCDOSYSMail = Server.CreateObject("CDO.Message") 
Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration") 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.meutenda.com.br" 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
objCDOSYSCon.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "autoagendamento@meutenda.com.br"
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "T3nd4*123"
objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
objCDOSYSCon.Fields.update 
Set objCDOSYSMail.Configuration = objCDOSYSCon 
objCDOSYSMail.From = "Contato Portifolio <autoagendamento@meutenda.com.br>"
objCDOSYSMail.To = "cssmasterti@gmail.com"
objCDOSYSMail.Subject = "Contato Portifolio - " & Email 
objCDOSYSMail.HtmlBody = mensagem 
objCDOSYSMail.Send 
Set objCDOSYSMail = Nothing 
Set objCDOSYSCon = Nothing
'----------------------------------------Enviar e-mail----------------------------------------


'----------------------------------------Chama retorno----------------------------------------
Response.Redirect("retorno.asp?Data='" & Data & "'&nomeLoja='" & nomeLoja & "'&idade='" & idade & "'&telefone='" & telefone  & "'&email='" & email  & "'&nome='" & nome  & "'&renda='" & renda & "'&Estado='" & Estado & "'&IDLoja='" & IDLoja & "'")
'----------------------------------------Chama retorno----------------------------------------
%>