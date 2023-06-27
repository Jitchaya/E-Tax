codeunit 70100 "TextFile"
{
    trigger OnRun()
    begin

    end;

    procedure CreateTextFile(tblAPIBody: Record "API Body")
    var
        InStr: InStream;
        OutStr: OutStream;
        tmpBlob: Codeunit "Temp Blob";
        FileName: Text;
        StartTime: Time;
        EndTime: Time;
        ElapsedTime: Integer;
        //HowLong: Duration;  
        CRLF: Text[2];
        Counter: Integer;
    begin
        StartTime := System.Time;
        CRLF[1] := 13;
        CRLF[2] := 10;
        FileName := 'TestFile.txt';
        tmpBlob.CreateOutStream(OutStr, TextEncoding::Windows);
        tblAPIBody.Setrange("idBody", tblAPIBody.idBody);
        if tblAPIBody.FindSet() then
            repeat
                OutStr.WriteText(StrSubstNo('"%1",', tblAPIBody."C01-SELLER_TAX_ID"));
                OutStr.WriteText(StrSubstNo('"%1",', tblAPIBody."C02-SELLER_BRANCH_ID"));
                OutStr.WriteText(StrSubstNo('"%1"', tblAPIBody."C03-FILE_NAME"));
            until tblAPIBody.Next() = 0;
        //OutStr.WriteText(StrSubstNo(FileName));
        //OutStr.WriteText('Start time: ' + Format(StartTime) + CRLF);
        //OutStr.WriteText();
        /*for Counter := 1 to 5000000 do begin
            OutStr.WriteText(Format(Counter) + ': This is a line in the text file' + CRLF);
            //OutStr.WriteText();
        end;*/
        EndTime := System.Time;
        //OutStr.WriteText('End time: ' + Format(StartTime) + CRLF);
        // OutStr.WriteText();  
        ElapsedTime := EndTime - StartTime;
        //OutStr.WriteText('Elapsed time: ' + Format(ElapsedTime));
        tmpBlob.CreateInStream(InStr, TextEncoding::Windows);
        DownloadFromStream(InStr, '', '', '', FileName);
    end;
}