unit PrimeFactors.DUnitX.Test;

interface

uses
  System.Rtti,
  System.SysUtils,
  Spring.Collections,
  DUnitX.TestFramework,
  PrimeFactors,
  PrimeFactors.Utils;

type
  [TestFixture]
  TPrimeFactorsTest = class(TObject)
  public
    [Test]
    procedure TestPrimeFactors;
  end;

  TTestMapping = record
  public
    Name: string;
    Input: Integer;
    Expected: TArray<Integer>;
  end;

var
  TestMappingArray: Array[0..9] of TTestMapping = (
   (Name : 'FactorsTest1'; Input: 1; Expected:[]),
   (Name : 'FactorsTest2'; Input: 2; Expected:[2]),
   (Name : 'FactorsTest3'; Input: 3; Expected:[3]),
   (Name : 'FactorsTest4'; Input: 4; Expected:[2, 2]),
   (Name : 'FactorsTest5'; Input: 5; Expected:[5]),
   (Name : 'FactorsTest6'; Input: 6; Expected:[2, 3]),
   (Name : 'FactorsTest7'; Input: 7; Expected:[7]),
   (Name : 'FactorsTest8'; Input: 8; Expected:[2, 2, 2]),
   (Name : 'FactorsTest9'; Input: 9; Expected:[3, 3]),
   (Name : 'FactorsTest10'; Input: 2 * 2 * 3 * 3 * 5 * 7 * 11 * 11 * 13; Expected:[2, 2, 3, 3, 5, 7, 11, 11, 13])
  );

implementation

procedure TPrimeFactorsTest.TestPrimeFactors;
var
  Factors: TArray<Integer>;
  I: Integer;
  TestMapping: TTestMapping;
begin
  for I := Low(TestMappingArray) to High(TestMappingArray) do
  begin
    TestMapping := TestMappingArray[I];
    Factors := TPrime.Factorization(TestMapping.Input);

    Assert.AreEqual(
      Factors, TestMapping.Expected,
      Format('Test Case %s: Input: %d - Expected %s <> Actual %s', [
        TestMapping.Name,
        TestMapping.Input,
        TestMapping.Expected.ToString,
        Factors.ToString]
      )
    );
  end;
end;

end.
