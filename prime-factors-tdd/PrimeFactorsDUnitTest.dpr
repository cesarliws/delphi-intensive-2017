program PrimeFactorsDUnitTest;

//{$I Spring.Tests.inc}

uses
  TestFramework,
  TestExtensions,
  Spring.Testing,
  Spring.TestRunner,
  Spring.TestUtils,
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

