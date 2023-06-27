codeunit 50300 "E-Tax API"
{
    trigger OnRun()
    begin

    end;

    procedure z_SendRequest(Var p_APISetup: Record "API Setup"; var p_Reponse: Text) gStatus: text;
    var
        gTokenURLTxt: Text[2048];
        // RequestBody: Label 'grant_type=password&username=%1&password=%2';
        HttpClient: HttpClient;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        RequestHeader: HttpHeaders;
        Content: HttpContent;
        //Base64Convert: Codeunit "Base64 Convert";
        gAuthString: Text;
        z_Tools: Codeunit "Json Tools";
    begin
        HttpClient.Clear();
        RequestHeader.Clear();
        clear(ResponseMessage);
        Content.Clear();
        //HTTP GET/ POST Request
        case p_APISetup.Method
        of
            p_APISetup.Method::GET:
                begin
                    z_SetAuthorization(p_APISetup, HttpClient);
                    HttpClient.Get(p_APISetup.URL, ResponseMessage);
                end;
            p_APISetup.Method::POST:
                begin
                    RequestMessage.Method(Format(p_APISetup.method));
                    z_SetAuthorization(p_APISetup, HttpClient);
                    RequestMessage.SetRequestUri(p_APISetup.URL);
                    Content.GetHeaders(RequestHeader);
                    Content.WriteFrom(format(z_Tools.z_API2Json('0')));
                    RequestHeader.Remove(p_APISetup.FieldCaption("Content-Type"));
                    IF p_APISetup."Content-Type" = p_APISetup."Content-Type"::"X-www-form-urlencoded" THEN
                        RequestHeader.Add(p_APISetup.FieldCaption("Content-Type"), 'application/' + Format(p_APISetup."Content-Type"))
                    else
                        RequestHeader.Add(p_APISetup.FieldCaption("Content-Type"), 'application/' + Format(p_APISetup."Content Format"));
                    RequestMessage.Content := Content;
                    HttpClient.Send(RequestMessage, ResponseMessage);
                end;
            else
                Error('Development is Pending for the Selected Method');
        end;
        ResponseMessage.Content().ReadAs(p_Reponse);
        IF ResponseMessage.IsSuccessStatusCode then
            gStatus := 'Success : ' + format(ResponseMessage.HttpStatusCode)
        else
            gStatus := 'Failed : ' + format(ResponseMessage.HttpStatusCode);
    end;

    local procedure z_SetAuthorization(Var p_APISetup: Record "API Setup"; var HttpClient: HttpClient)
    var
        gAuthString: Text;
        cuBase64Convert: Codeunit "Base64 Convert";
    begin
        //Creating Authorization Header
        Clear(gAuthString);
        Case p_APISetup."Authorization Type"
        of
            p_APISetup."Authorization Type"::"No Auth":
                exit;
            /*p_APISetup."Authorization Type"::"Basic Auth":
                begin
                    //AuthString := StrSubstNo('%1:%2', p_APISetup.Username, p_APISetup.Password);
                    AuthString := cuBase64Convert.ToBase64(AuthString);
                    AuthString := StrSubstNo('Basic %1', AuthString);
                    HttpClient.DefaultRequestHeaders().Add('Authorization', AuthString);
                    HttpClient.DefaultRequestHeaders().Add('User-Agent', 'Tech-Lucky_Postman');
                end;*/
            p_APISetup."Authorization Type"::"Brearer Token":
                begin
                    HttpClient.DefaultRequestHeaders().Add('Authorization', StrSubstNo('Bearer %1', p_APISetup.Authorization));
                    HttpClient.DefaultRequestHeaders().Add('User-Agent', 'Tech-Lucky_Postman');
                end;
            else
                Error('Development is Pending for the Selected Authorization Type');
        end;
    end;
}