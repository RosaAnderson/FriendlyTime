unit untFunction;

interface

uses
    System.SysUtils;

    function FriendlyTime(vfDateTime: TDateTime): string;

implementation

function FriendlyTime(vfDateTime: TDateTime): string;
var
    vMinuteA, vHourA: SmallInt;

    vTimeN, vTimeR: SmallInt;

    vDayN, vMonthN, vYearN: SmallInt;
    vDayR, vMonthR, vYearR: SmallInt;

    vHourN, vMinuteN, vSecondN: SmallInt;
    vHourR, vMinuteR, vSecondR: SmallInt;
begin
    // pega a data atual separada em dia, mes e ano
    vDayN   := StrToInt(FormatDateTime('dd'  , Now));
    vMonthN := StrToInt(FormatDateTime('mm'  , Now));
    vYearN  := StrToInt(FormatDateTime('yyyy', Now));

    // pega a data recebida separada em dia, mes e ano
    vDayR   := StrToInt(FormatDateTime('dd'  , vfDateTime));
    vMonthR := StrToInt(FormatDateTime('mm'  , vfDateTime));
    vYearR  := StrToInt(FormatDateTime('yyyy', vfDateTime));

    // pega a hora atual separada em hora, minuto e segundo
    vHourN   := StrToInt(FormatDateTime('hh', Now));
    vMinuteN := StrToInt(FormatDateTime('nn', Now));
    vSecondN := StrToInt(FormatDateTime('ss', Now));

    // pega a hora recebida separada em hora, minuto e segundo
    vHourR   := StrToInt(FormatDateTime('hh', vfDateTime));
    vMinuteR := StrToInt(FormatDateTime('nn', vfDateTime));
    vSecondR := StrToInt(FormatDateTime('ss', vfDateTime));


    // define a string de tempo inicial
    Result := FormatDateTime('d', vfDateTime) + ' de ' + FormatDateTime('mmm', vfDateTime) + ' de ' + FormatDateTime('yyyy', vfDateTime);

    // se o ano atual for igual ao ano recebido
    if vYearN = vYearR then
    begin
        // se o mes atual for igual ao mes recebido
        if vMonthN = vMonthR then
        begin
            // se o dia atual for igual ao dia recebido
            if vDayN = vDayR then
            begin
                // se a hora atual for igual a hora recebida
                if vHourN = vHourR then
                begin
                    // se o minuto atual for igual ao minuto recebido
                    if vMinuteN = vMinuteR then
                    begin
                        // mostra a string de tempo
                        Result := 'há menos de um minuto.';

                        // verifica se o tempo decorrido é menor que 10 segundos
                        if (vSecondN - vSecondR) < 10 then
                            Result := 'há pouco.' // mostra a string de tempo

                        // verifica se o tempo decorrido é menor que 20 seggundos
                        else if (vSecondN - vSecondR) < 20 then
                            Result := 'segundos atrás.'; // mostra a string de tempo
                    end
                    else
                    begin
                        // mostra a string de tempo
                        Result := 'há menos de um minuto.';

                        // define o tempo em segundos
                        vTimeN := (vMinuteN * 60) + vSecondN;
                        vTimeR := (vMinuteR * 60) + vSecondR;

                        // calcula o tempo passado
                        vMinuteA := Trunc((vTimeN - vTimeR) / 60);

                        // verifica se o tempo decorrido é igual a 1 minuto
                        if vMinuteA = 1 then
                            Result := 'um minuto atrás.' // mostra a string de tempo

                        // verifica se o tempo decorrido é maior que 1 minuto
                        else if vMinuteA > 1 then
                            Result := IntToStr(vMinuteA) + ' minutos atrás.'; // mostra a string de tempo
                    end;
                end
                else
                begin
                    // define o tempo em segundos
                    vTimeN := (vHourN * 60) + vMinuteN;
                    vTimeR := (vHourR * 60) + vMinuteR;

                    // calcula o tempo passado
                    vHourA := vTimeN - vTimeR;

                    // verifica se o tempo passado é menor que 1 hora
                    if vHourA < 60 then
                    begin
                        // define o tempo passado
                        vMinuteA := vHourA;

                        // verifica se o tempo decorrido é igual a 1 minuto
                        if vMinuteA = 1 then
                            Result := 'um minuto atrás.' // mostra a string de tempo

                        // verifica se o tempo decorrido é maior que 1 minuto
                        else if vMinuteA > 1 then
                            Result := IntToStr(vMinuteA) + ' minutos atrás.'; // mostra a string de tempo
                    end

                    // verifica se o tempo decorrido é igual a 60 minutos
                    else if vHourA = 60 then
                    begin
                        Result := 'uma hora atrás.'; // mostra a string de tempo
                    end

                    // verifica se o tempo passado é maior que 60 minutos
                    else if vHourA > 60 then
                    begin
                        // calcula o tempo em hora
                        vHourA := Trunc(vHourA / 60);

                        // mostra a string de tempo
                        Result := 'uma hora atrás.';

                        // verifica se o tempo decorrido é maior q 1 hora
                        if vHourA > 1 then
                            Result := IntToStr(vHourA) + ' horas atrás.';// mostra a string de tempo
                    end;
                end;
            end;
        end;
    end;
end;

end.
