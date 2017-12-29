unit PrimeFactors.DUnit.Test;

interface

uses
  Spring.Testing,
  PrimeFactors,
  PrimeFactors.Utils;

type
  TPrimeFactorsData = class
  public
    class function FactorsCases: TArray<TArray<TValue>>; static;
  end;

  TPrimeFactorsTest = class(TTestCase)
  published
    [TestCaseSource(TPrimeFactorsData, 'FactorsCases')]
    procedure CheckPrimeFactorsTest(Input: Integer; ExpectedResult: TArray<Integer>);
  end;

implementation

class function TPrimeFactorsData.FactorsCases: TArray<TArray<TValue>>;

  function TestCase(Value: Integer; Factors: TArray<Integer>): TArray<TValue>;
  begin
    Result := TArray<TValue>.Create(Value, TValue.From<TArray<Integer>>(Factors));
  end;
begin
  // https://en.wikipedia.org/wiki/Prime_factor
  Result :=
    TArray<TArray<TValue>>.Create(
      TestCase(1, []),
      TestCase(2, [2]),
      TestCase(3, [3]),
      TestCase(4, [2, 2]),
      TestCase(5, [5]),
      TestCase(6, [2, 3]),
      TestCase(7, [7]),
      TestCase(8, [2, 2, 2]),
      TestCase(9, [3, 3]),
      TestCase(144, [2, 2, 2, 2, 3, 3]),
      TestCase(360, [2, 2, 2, 3, 3, 5]),
      TestCase(2 * 2 * 3 * 3 * 5 * 7 * 11 * 11 * 13, [2, 2, 3, 3, 5, 7, 11, 11, 13])
    );
end;

procedure TPrimeFactorsTest.CheckPrimeFactorsTest(Input: Integer; ExpectedResult: TArray<Integer>);
begin
  CheckEquals(ExpectedResult.ToString, TPrime.Factorization(Input).ToString);
end;

end.
