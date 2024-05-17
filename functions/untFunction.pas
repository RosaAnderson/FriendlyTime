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
    Result := FormatDateTime('d', vfDateTime) + ' de ' +
                  FormatDateTime('mmm', vfDateTime) + ' de ' +
                      FormatDateTime('yyyy', vfDateTime);

    if vYearN = vYearR then // se o ano atual for igual ao ano recebido
    begin
        if vMonthN = vMonthR then // se o mes atual for igual ao mes recebido
        begin
            if vDayN = vDayR then // se o dia atual for igual ao dia recebido
            begin
                if vHourN = vHourR then // se a hora atual for igual a hora recebida
                begin
                    // se o minuto atual for igual ao minuto recebido
                    if vMinuteN = vMinuteR then
                    begin
                        Result := 'há menos de um minuto.'; // mostra a string de tempo

                        if (vSecondN - vSecondR) < 10 then // verifica se o tempo decorrido é menor que 10 segundos
                            Result := 'há pouco.' // mostra a string de tempo
                        else
                        if (vSecondN - vSecondR) < 20 then // verifica se o tempo decorrido é menor que 20 seggundos
                            Result := 'segundos atrás.'; // mostra a string de tempo
                    end
                    else
                    begin
                        Result := 'há menos de um minuto.'; // mostra a string de tempo

                        // define o tempo em segundos
                        vTimeN := (vMinuteN * 60) + vSecondN;
                        vTimeR := (vMinuteR * 60) + vSecondR;

                        vMinuteA := Trunc((vTimeN - vTimeR) / 60); // calcula o tempo passado

                        if vMinuteA = 1 then // verifica se o tempo decorrido é igual a 1 minuto
                            Result := 'um minuto atrás.' // mostra a string de tempo
                        else
                        if vMinuteA > 1 then // verifica se o tempo decorrido é maior que 1 minuto
                            Result := IntToStr(vMinuteA) + ' minutos atrás.'; // mostra a string de tempo
                    end;
                end
                else
                begin
                    // define o tempo em segundos
                    vTimeN := (vHourN * 60) + vMinuteN;
                    vTimeR := (vHourR * 60) + vMinuteR;

                    vHourA := vTimeN - vTimeR; // calcula o tempo passado

                    if vHourA < 60 then // verifica se o tempo passado é menor que 1 hora
                    begin
                        vMinuteA := vHourA; // define o tempo passado

                        if vMinuteA = 1 then // verifica se o tempo decorrido é igual a 1 minuto
                            Result := 'um minuto atrás.' // mostra a string de tempo
                        else
                        if vMinuteA > 1 then // verifica se o tempo decorrido é maior que 1 minuto
                            Result := IntToStr(vMinuteA) + ' minutos atrás.'; // mostra a string de tempo
                    end
                    else
                    if vHourA = 60 then // verifica se o tempo decorrido é igual a 60 minutos
                    begin
                        Result := 'uma hora atrás.'; // mostra a string de tempo
                    end
                    else
                    if vHourA > 60 then // verifica se o tempo passado é maior que 60 minutos
                    begin
                        vHourA := Trunc(vHourA / 60); // calcula o tempo em hora
                        
                        Result := 'uma hora atrás.'; // mostra a string de tempo

                        if vHourA > 1 then // verifica se o tempo decorrido é maior q 1 hora
                            Result := IntToStr(vHourA) + ' horas atrás.'; // mostra a string de tempo
                    end;
                end;
            end;
        end;
    end;
end;

end.
