unit PrimeFactors;

// Número primo

interface

type
  TPrime = record
  public
    class function Factorization(Number: Integer): TArray<Integer>; static;
  end;

implementation

class function TPrime.Factorization(Number: Integer): TArray<Integer>;
var
  Divisor: Integer;
  Factors: TArray<Integer>;
  Remainder: Integer;
begin
  Divisor   := 2;
  Factors   := [];
  Remainder := Number;

  while Remainder > 1 do
  begin
    while (Remainder mod Divisor) = 0 do
    begin
      Factors := Factors + [Divisor];
      Remainder := Remainder div Divisor;
    end;

    Inc(Divisor);
  end;

  Result := Factors;
end;

end.

