unit PrimeFactors.Utils;

interface

uses
  System.SysUtils;

type
  TArrayOfIntegerHelper = record helper for TArray<Integer>
  public
    function ToString: string;
  end;

implementation

function TArrayOfIntegerHelper.ToString: string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(Self) to High(Self) do
  begin
    Result := Result + IntToStr(Self[I]) + ',';
  end;

  if Result.EndsWith(',') then
  begin
    Delete(Result, Length(Result), 1);
  end;

  Result := '[' + Result + ']';
end;

end.
