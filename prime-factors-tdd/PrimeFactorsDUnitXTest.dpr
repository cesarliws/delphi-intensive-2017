program PrimeFactorsDUnitXTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}

uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  PrimeFactors.DUnitX.Test in 'PrimeFactors.DUnitX.Test.pas',
  DUnitX.TestFramework,
  PrimeFactors in 'PrimeFactors.pas',
  PrimeFactors.Utils in 'PrimeFactors.Utils.pas';

var
  Logger: ITestLogger;
//  NUnitLogger: ITestLogger;
  Results: IRunResults;
  Runner: ITestRunner;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  Exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;

    //Create the test runner
    Runner := TDUnitX.CreateRunner;

    //Tell the runner to use RTTI to find Fixtures
    Runner.UseRTTI := True;

    //tell the runner how we will log things
    //Log to the console window
    Logger := TDUnitXConsoleLogger.Create(true);
    Runner.AddLogger(Logger);

//    //Generate an NUnit compatible XML File
//    NUnitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
//    Runner.AddLogger(NUnitLogger);
//    Runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    Results := Runner.Execute;
    if not Results.AllPassed then
    begin
      System.ExitCode := EXIT_ERRORS;
    end;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
    begin
      System.Writeln(E.ClassName, ': ', E.Message);
    end;
  end;
end.
