import Test.HUnit
import UserInput (getParams, PandocConfig(..))

defaultConf :: PandocConfig
defaultConf = PandocConfig
    {
    inputFile = Nothing,
    inputFormat = Nothing,
    outputFile = Nothing,
    outputFormat = Nothing
    }

testValidArgs :: Test
testValidArgs = TestCase (assertEqual "test valid args"
                    (Just (PandocConfig (Just "in") (Just "xml") (Just "in") (Just "in")))
                    (getParams ["-i", "in", "-f", "xml", "-o", "in", "-e", "in"] defaultConf))

testUnknownArg :: Test
testUnknownArg = TestCase (assertEqual "test unknown arg"
                    (Nothing)
                    (getParams ["-none", "in", "-f", "xml"] defaultConf))

testTooManyArgs :: Test
testTooManyArgs = TestCase (assertEqual "test too many args"
                    (Nothing)
                    (getParams ["-i", "in", "-f", "xml", "-o", "in", "-e", "in", "-none", "in"] defaultConf))

testNotEnoughArgs :: Test
testNotEnoughArgs = TestCase (assertEqual "test not enough args"
                    (Nothing)
                    (getParams ["-f", "json"] defaultConf))

tests :: Test
tests = TestList [TestLabel "test valid args" testValidArgs,
                  TestLabel "test unknown arg" testUnknownArg,
                  TestLabel "test too many args" testTooManyArgs,
                  TestLabel "test not enough args" testNotEnoughArgs]

main :: IO Counts
main = runTestTT tests
