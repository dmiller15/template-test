class: CommandLineTool
cwlVersion: v1.0
baseCommand: ["cat", "example.txt"]

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - entryname: example.txt
        entry: |-
          ${
              var text = ""
              for (var i = 0; i < inputs.files.length; i++) {
                  text += inputs.files[i].path + "\n"
              }
              return text
          }

inputs:
  files: 'File[]' 
outputs:
  example_out:
    type: stdout
stdout: output.txt
