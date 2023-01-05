# Project Goal
### Full run including Encoding, Channel Simulation, and Decoding
## This Project contains three modules below
#### a.	Source Coding (Image Compression) – QOI (Quite OK Image Format)
#### b.	Channel Coding (Error Correction Code) – Polar Code
#### c.	Simulated AWGN Channel
![System Overview](./graph/overview.png)
## DEMO
#### &ensp; Low SNR / Low Iter &emsp;&emsp;&nbsp; Low SNR / Moderate Iter &emsp;&emsp;&nbsp; Low SNR / High Iter &emsp;&emsp;&emsp; High SNR / Low Iter
<img src="./graph/cat_1.gif" width="180" height="288"/> &emsp; <img src="./graph/cat_2.gif" width="180" height="288"/> &emsp; <img src="./graph/cat_3.gif" width="180" height="288"/> &emsp; <img src="./graph/cat_4.gif" width="180" height="288"/>
### Code Structure
```
| -- README.md # overview of the project
| -- build/ # build scripts – bitstream generation
| -- docs/ # Documentation files – ppt, pdf, md
| -- src/ # Source files, include kernel & host code, cpp, hpp, other include files
| | -- baseline/ # original code from open source, or before optimization is applied
| | -- README.md # describe where the original design is from
| | -- host/ # host code
| | -- kernel_opt1/ # kernel code with optimization opt1 – note: use in-line pragma
| (| -- kernel_opt2/) # may contain kernel code with different optimization strategy
|-- data/ # data files used in the project, include input test data and output result data
| | -- README.md # describes where data came from, structure of data
| (| -- sub-folder/) # may contain subdirectories
| -- impl_result/ # implementation result files, includes
# makefile, meta-data, reports, e.g. vitis summary file, HLS synth report
|-- tests/ # Automated tests
| |-- integration # End-to-end, integration tests
| |-- unit # Unit tests – module level if there is
| -- LICENSE # License fiel, we use MIT License (refer to last page of the ppt)

```
