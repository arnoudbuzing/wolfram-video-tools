BeginPackage["VideoTools`"];

FFMPEG::usage = "FFMPEG[\"command\"] interfaces with the 'ffmpeg' binary";
FFMPEG::setbinary = "The file `1` could not be found";

Begin["`Private`"];

FFMPEG["SetBinary", binary_] := If[
  FileType[binary] === File,
  PersistentValue["FFMPEG"] = binary,
  Message[FFMPEG::setbinary, binary];
];

runcommand[args__] := StringReplace[
  RunProcess[
      Join[
        { PersistentValue["FFMPEG"], "-hide_banner" },
        { args } /. OptionTranslation
      ], "StandardOutput"],
  "\r\n"->"\n" ];


OptionTranslation = {
  "License" -> "-L",
  "Help" -> "-help",
  "Version" -> "-version",
  "Formats" -> "-formats",
  "Muxers" -> "-muxers",
  "Demuxers" -> "-demuxers",
  "Devices" -> "-devices",
  "Codecs" -> "-codecs",
  "Decoders" -> "-decoders",
  "Encoders" -> "-encoders",
  "BitstreamFilters" -> "-btfs",
  "Protocols" -> "-protocols",
  "Filters" -> "-filters",
  "PixelFormats" -> "-pix_fmts",
  "SampleFormats" -> "-sample_fmts",
  "ChannelLayouts" -> "-layouts",
  "Colors" -> "-colors",
  "Sources" -> "-sources",
  "Sinks" -> "-sinks"
};

FFMPEG[ args__ ] := runcommand[ args ];

End[]; (* `Private` *)

EndPackage[]