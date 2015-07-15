{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as BS
import Data.Csv
import qualified Data.Vector as V

data Event = Event
    { date1      :: !String
    , date2      :: !String
    , date3      :: !String
    , amount     :: !String
    , from       :: !String
    , account    :: !String
    , bic        :: !String
    , event      :: !String
    , reference  :: !String
    , reference2 :: !String
    , message    :: !String
    , cardNumber :: !String
    , receipt    :: !String
    }

instance FromNamedRecord Event where
    parseNamedRecord r = Event <$>
        r .: "DATE1" <*>
        r .: "DATE2" <*>
        r .: "DATE3" <*>
        r .: "AMOUNT" <*>
        r .: "FROM" <*>
        r .: "ACCOUNT" <*>
        r .: "BIC" <*>
        r .: "EVENT" <*>
        r .: "REFERENCE" <*>
        r .: "REFERENCE2" <*>
        r .: "MESSAGE" <*>
        r .: "CARDNUMBER" <*>
        r .: "RECEIPT"

main :: IO ()
main = do
    csvData <- BL.readFile "sample.tsv"
    case decodeByNameWith defaultDecodeOptions { decDelimiter = 9 } csvData of
        Left err -> putStrLn err
        Right (_, v) -> V.forM_ v $ \ p ->
            putStrLn $ date1 p ++ ": " ++ (amount p) ++ "e"

