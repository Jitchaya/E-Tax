codeunit 50400 "E-Tax API Test"
{
    procedure z_CallAPI(): Text
    var
        tblAPI: Record "API Setup";
        cu_Tools: Codeunit "Json Tools";
        /*Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        Request: HttpRequestMessage;
        HeaderContent: HttpHeaders;
        gParameter, gResponseText : Text;
        gURL: Text;
        gOutputURL: Text;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        gJsonText: Text;*/

        HttpClient: HttpClient;
        HttpContent: HttpContent;
        HttpHeadersContent, HttpHeadersRequestMessage : HttpHeaders;
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        Parameters, ResponseText : Text;
        JsonObject, DataJsonObject, OptionsJsonObject : JsonObject;
        JsonToken: JsonToken;
        gJsonText: Text;
        gContent: Text;
        ContentHeader: HTTPHeaders;
        gContent_type: Text;
        gAuthorization: Text;

    begin
        /*Method 1
        Client.Get('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument',Response);
        if Response.IsSuccessStatusCode then
        Content := Response.Content;
        else
        Message('Response was nagative %1,%2',Response.HttpStatusCode,Response.ReasonPhrase);
        Content.ReadAs(gOutputURL);
        Message(gOutputURL);*/

        //Method 2
        /*Request.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
        Request.Method('Get');
        Client.Send(Request, Response);
        if Response.IsSuccessStatusCode then
        Content := Response.Content
        else
        Message('Response was nagative %1,%2',Response.HttpStatusCode,Response.ReasonPhrase);
        Content.ReadAs(gOutputURL);
        Message(gOutputURL);*/

        //Method 3
        /*Client.Get('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument',Response);
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
            NewJsobject.ReadFrom(gOutput);
            NewJsobject.Get('L01-LINE_ID',NewJsobject);
            API.'L01-LINE_ID' := NewJToken.AsValue().AsText();
         end
            Error('Jsontoken is not having the data available as JSON Object');
        end
        else
        Message('Response was nagative %1,%2',Response.HttpStatusCode,Response.ReasonPhrase);*/

        //tblAPITable.DeleteAll();
        /*HeaderContent := Client.DefaultRequestHeaders;
        HeaderContent.Add('Content-Type','application/json');
        HeaderContent.Add('Authorization', tblAPI."Authorization");
        gURL := 'https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument';
        Request.SetRequestUri(gURL);
        gOutputURL := Request.GetRequestUri();
        Message(gOutputURL);
        Request.Method('POST');
        Client.Send(Request, Response);*/
        // if Response.IsSuccessStatusCode then
        //    Response.Content.ReadAs(gJsonText);

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
        Response.Content.ReadAs(gJsonText);
        Message(gJsonText);*/
        //tblAPI.Get();
        /*Request.Method := 'POST';
        Request.GetHeaders(HeaderContent);
        HeaderContent.Clear();
        HeaderContent.Add('Content-Type', 'application/json');
        HeaderContent.Add('Authorization', tblAPI."Authorization");
        Content.WriteFrom(format(cu_Tools.API2Json('0')));
        Request.Content(Content);
        Request.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
        Client.Send(Request, Response);
        Response.Content.ReadAs(gJsonText);
        exit(gJsonText);*/

        gContent_type := 'application/json';
        gAuthorization := 'MjY6cno2a2lKeGE2Q3JXOFNUcEYzcHlmZW0wN29LRDl3cUxKUTFjV3ZZOTpleUowWVhocFpDSTZJakF4TURVMU1qZ3dNVEF3T0RraUxDSndZWE56ZDI5eVpDSTZJa0Z0ZDJGNUl6RXlNelFpZlE0RVlKV0tpRTlwVHlRcVpZODBlSGZwU01GRlJ1SnFMeQ==';
        HttpRequestMessage.Method := 'POST';
        HttpRequestMessage.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
        HttpContent.GetHeaders(HttpHeadersContent);
        ContentHeader.Add('Authorization', 'Bearer ' + gAuthorization);
        HttpContent.getHeaders(ContentHeader);
        ContentHeader.clear();
        ContentHeader.Add('Content-Type', gContent_type);
        HttpContent.WriteFrom(format(cu_Tools.z_API2Json('0')));
        HttpRequestMessage.Content := HttpContent;
        HttpClient.Send(HttpRequestMessage, HttpResponseMessage);
        HttpResponseMessage.Content.ReadAs(gJsonText);
        Message(gJsonText);
    end;
}