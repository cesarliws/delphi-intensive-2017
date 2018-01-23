program PrimeFactorsDUnitTest;

uses
  TestFramework,
  Spring.TestRunner,
  PrimeFactors in 'PrimeFactors.pas',
  PrimeFactors.DUnit.Test in 'PrimeFactors.DUnit.Test.pas',
  PrimeFactors.Utils in 'PrimeFactors.Utils.pas';

procedure RegisterTestCases;
begin
  RegisterTests('PrimeFactors', [
    TPrimeFactorsTest.Suite
  ]);
end;

begin
  RegisterTestCases;
  RunRegisteredTests;
  TestFramework.ClearRegistry;
end.

