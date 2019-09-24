BeginPackage["VideoTools`"];

FFMPEG::usage = "FFMPEG[\"command\"] interfaces with the 'ffmpeg' binary";
FFMPEG::setbinary = "The file `1` could not be found";

Begin["`Private`"];

End[]; (* `Private` *)

runcommand[args__] := StringReplace[
  RunProcess[{ PersistentValue["FFMPEG"], "-hide_banner", args}, "StandardOutput"],
  "\r\n"->"\n" ];

FFMPEG["SetBinary", binary_] := If[
  FileType[binary] === File,
  PersistentValue["FFMPEG"] = binary,
  Message[FFMPEG::setbinary, binary];
];

FFMPEG["License"] := runcommand["-L"];

FFMPEG["Version"] := runcommand["-version"];

FFMPEG["Formats"] := runcommand["-formats"];

FFMPEG["Muxers"] := runcommand["-muxers"];

FFMPEG["Demuxers"] := runcommand["-demuxers"];

FFMPEG["Devices"] := runcommand["-devices"];

FFMPEG["Codecs"] := runcommand["-codecs"];

FFMPEG["Decoders"] := runcommand["-decoders"];

FFMPEG["Encoders"] := runcommand["-encoders"];

FFMPEG["BitstreamFilters"] := runcommand["-btfs"];

FFMPEG["Protocols"] := runcommand["-protocols"];



EndPackage[]