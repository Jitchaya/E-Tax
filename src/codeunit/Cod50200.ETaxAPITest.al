codeunit 50200 "ETax API Test"
{
    trigger OnRun()
    begin

    end;

    procedure SendRequest(Var API: Record "API Setup"; var Reponse: Text) Status: text;
    var
        TokenURLTxt: Text[2048];
        // RequestBody: Label 'grant_type=password&username=%1&password=%2';
        HttpClient: HttpClient;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        RequestHeader: HttpHeaders;
        Content: HttpContent;
        //Base64Convert: Codeunit "Base64 Convert";
        AuthString: Text;
        Tools: Codeunit "Json Tools";
    begin
        HttpClient.Clear();
        RequestHeader.Clear();
        clear(ResponseMessage);
        Content.Clear();
        //HTTP GET/ POST Request
        case API.Method
        of
            API.Method::GET:
                begin
                    Set_Authorization(API, HttpClient);
                    HttpClient.Get(API.URL, ResponseMessage);
                end;
            API.Method::POST:
                begin
                    RequestMessage.Method(Format(API.method));
                    Set_Authorization(API, HttpClient);
                    RequestMessage.SetRequestUri(API.URL);
                    Content.GetHeaders(RequestHeader);
                    Content.WriteFrom(format(Tools.API2Json('0')));
                    RequestHeader.Remove(API.FieldCaption("Content-Type"));
                    RequestHeader.Add(API.FieldCaption("Content-Type"), 'application/json');
                    RequestMessage.Content := Content;
                    HttpClient.Send(RequestMessage, ResponseMessage);
                end;
            else
                Error('Development is Pending for the Selected Method');
        end;
        ResponseMessage.Content().ReadAs(Reponse);
        IF ResponseMessage.IsSuccessStatusCode then
            Status := 'Success : ' + format(ResponseMessage.HttpStatusCode)
        else
            Status := 'Failed : ' + format(ResponseMessage.HttpStatusCode);
    end;

    local procedure Set_Authorization(Var API: Record "API Setup"; var HttpClient: HttpClient)
    var
        AuthString: Text;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        //Creating Authorization Header
        Clear(AuthString);
        Case API."Authorization Type"
        of
            API."Authorization Type"::"No Auth":
                exit;
            /*API."Authorization Type"::"Basic Auth":
                begin
                    //AuthString := StrSubstNo('%1:%2', API.Username, API.Password);
                    AuthString := Base64Convert.ToBase64(AuthString);
                    AuthString := StrSubstNo('Basic %1', AuthString);
                    HttpClient.DefaultRequestHeaders().Add('Authorization', AuthString);
                    HttpClient.DefaultRequestHeaders().Add('User-Agent', 'Tech-Lucky_Postman');
                end;*/
            API."Authorization Type"::"Brearer Token":
                begin
                    HttpClient.DefaultRequestHeaders().Add('Authorization', StrSubstNo('Bearer %1', API.Authorization));
                    HttpClient.DefaultRequestHeaders().Add('User-Agent', 'Tech-Lucky_Postman');
                end;
            else
                Error('Development is Pending for the Selected Authorization Type');
        end;

    end;
}