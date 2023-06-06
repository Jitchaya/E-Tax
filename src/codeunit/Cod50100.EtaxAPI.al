codeunit 50100 "Etax API"
{
    procedure CallAPI(): Text
    var
        tblAPI: Record "API Setup";
        Tools: Codeunit "Json Tools";
        /*Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        Request: HttpRequestMessage;
        HeaderContent: HttpHeaders;
        Parameter, ResponseText : Text;
        URL: Text;
        OutputURL: Text;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        JsonText: Text;*/

        HttpClient: HttpClient;
        HttpContent: HttpContent;
        HttpHeadersContent, HttpHeadersRequestMessage : HttpHeaders;
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        Parameters, ResponseText : Text;
        JsonObject, DataJsonObject, OptionsJsonObject : JsonObject;
        JsonToken: JsonToken;
        JsonText: Text;
        Content: Text;
        ContentHeader: HTTPHeaders;
        A: Text;
        B: Text;


    /*HttpClient: HttpClient;
    RequestMessage: HttpRequestMessage;
    ResponseMessage: HttpResponseMessage;
    RequestHeader: HttpHeaders;
    Content: HttpContent;
    Base64Convert: Codeunit "Base64 Convert";
    AuthString: Text;*/

    begin
        /*Method 1
        Client.Get('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument',Response);
        if Response.IsSuccessStatusCode then
        Content := Response.Content;
        else
        Message('Response was nagative %1,%2',Response.HttpStatusCode,Response.ReasonPhrase);
        Content.ReadAs(Result);
        Message(Result);*/

        /*Method 2
        Request.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
        Request.Method('Get');
        Client.Send(Request, Response);
        if Response.IsSuccessStatusCode then
        Content := Response.Content
        else
        Message('Response was nagative %1,%2',Response.HttpStatusCode,Response.ReasonPhrase);
        Content.ReadAs(Output);
        Message(Output);*/

        /*Method 3
        Client.Get('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument',Response);
        if Response.IsSuccessStatusCode then begin
        Content := Response.Content;
        Content.ReadAs(Result);
        //To store the content in JSON Object
        JObject.ReadFrom(Result);
        JObject.Get('C01-SELLER_TAX_ID',JToken);
        API.'C01-SELLER_TAX_ID' := JToken.AsValue().AsText();
        JObject.Get('LINE_ITEM_INFORMATION',JToken);
        if JObject.IsObject then begin
            JObject.WriteTo(Output);
            NewJsobject.ReadFrom(Output);
            NewJsobject.Get('L01-LINE_ID',NewJsobject);
            API.'L01-LINE_ID' := NewJToken.AsValue().AsText();
         end
            Error('Jsontoken is not having the data available as JSON Object');
        end
        else
        Message('Response was nagative %1,%2',Response.HttpStatusCode,Response.ReasonPhrase);
        */
        //tblAPITable.DeleteAll();
        /*Header := Client.DefaultRequestHeaders;
        Header.Add('Content-Type', tblAPI."Content-Type");
        Header.Add('Authorization', tblAPI."Authorization");
        URL := 'https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument';
        Request.SetRequestUri(URL);
        OutputURL := Request.GetRequestUri();
        Message(OutputURL);
        Request.Method('POST');
        Client.Send(Request, Response);*/
        // if Response.IsSuccessStatusCode then
        //    Response.Content.ReadAs(JsonText);

        /*if not Client.Get('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument', Response)
        then
            Error('The call to the E-Tax failed.');
        if not Response.IsSuccessStatusCode then begin
            error('Returned an error message:\\' +
                  'Status code: %1\' +
                  'Description: %2',
                  Response.HttpStatusCode,
                  Response.ReasonPhrase);
        end;
        Response.Content.ReadAs(JsonText);
        Message(JsonText);*/
        //tblAPI.Get();
        /*Request.Method := 'POST';
        Request.GetHeaders(HeaderContent);
        HeaderContent.Clear();
        HeaderContent.Add('Content-Type', tblAPI."Content-Type");
        HeaderContent.Add('Authorization', tblAPI."Authorization");
        Content.WriteFrom(format(Tools.API2Json(0)));
        Request.Content(Content);
        Request.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
        Client.Send(Request, Response);
        Response.Content.ReadAs(JsonText);
        exit(JsonText);*/

        A := 'application/json';
        B := 'MjY6cno2a2lKeGE2Q3JXOFNUcEYzcHlmZW0wN29LRDl3cUxKUTFjV3ZZOTpleUowWVhocFpDSTZJakF4TURVMU1qZ3dNVEF3T0RraUxDSndZWE56ZDI5eVpDSTZJa0Z0ZDJGNUl6RXlNelFpZlE0RVlKV0tpRTlwVHlRcVpZODBlSGZwU01GRlJ1SnFMeQ==';
        HttpRequestMessage.Method := 'POST';
        HttpRequestMessage.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
        HttpContent.GetHeaders(HttpHeadersContent);
        ContentHeader.Add('Authorization', 'bearer ' + B);
        HttpContent.getHeaders(ContentHeader);
        ContentHeader.clear();
        ContentHeader.Add('Content-Type', A);
        HttpContent.WriteFrom(format(Tools.API2Json(0)));
        HttpRequestMessage.Content := HttpContent;
        HttpClient.Send(HttpRequestMessage, HttpResponseMessage);
        HttpResponseMessage.Content.ReadAs(JsonText);
        Message(JsonText);

        /*HttpClient.Clear();
        RequestHeader.Clear();
        clear(ResponseMessage);
        Content.Clear();
        RequestMessage.Method(Format(Postman.method));
        Set_Authorization(Postman, HttpClient);
        RequestMessage.SetRequestUri(Postman.URL);
        Content.GetHeaders(RequestHeader);
        Content.WriteFrom(format(Tools.API2Json(0)));
        RequestHeader.Remove(Postman.FieldCaption("Content-Type"));*/
    end;
}