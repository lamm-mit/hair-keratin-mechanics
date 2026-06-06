# Comparative Molecular Dynamics Characterization of Hair Keratin Unfolding Mechanics
This repository contains code, datasets, and representative media supporting our study of hair keratin proteins using molecular dynamics (MD) and steered molecular dynamics (SMD) simulations.

This work aims to investigate the secondary structure evolution, strain-rate-dependent unfolding behavior, and nanomechanical response of hair keratin proteins, and to provide reproducible simulation workflows and curated datasets for future studies on keratin mechanics and fibrous biomaterials.

<img width="1246" height="351" alt="image" src="https://github.com/user-attachments/assets/af9116d5-106a-4804-9479-e97a17be8fda" />

## Contents
- Hair keratin protein dataset in CSV format, including protein properties and access links to corresponding FASTA and PDB files
- Simulation scripts for equilibration and steered molecular dynamics (SMD)
- Representative visualization media of protein unfolding simulations under different strain rates

<img width="1159" height="598" alt="image" src="https://github.com/user-attachments/assets/9411d5f7-858e-4cc0-bbf3-b0e7da906ea7" />

## Repository structure
- `data/`: protein datasets and metadata
- `code/`: simulation scripts and workflow files
- `media/`: videos and visual materials

## Keratin datasets

The keratin sequence, structure, and molecular-dynamics property datasets used in this work are available on Hugging Face under `lamm-mit`:

| Dataset | Contents |
|---|---|
| [`lamm-mit/keratin-fasta`](https://huggingface.co/datasets/lamm-mit/keratin-fasta) | 51 curated human keratin FASTA sequences with UniProt accessions, keratin type, organism metadata, sequence checksums, amino-acid composition, and molecular-weight descriptors. |
| [`lamm-mit/keratin-pdb`](https://huggingface.co/datasets/lamm-mit/keratin-pdb) | AlphaFold/AlphaFold2 PDB structures for the 51 keratins, including raw PDB text, chain/residue/atom metadata, SEQRES records, coordinate summaries, and pLDDT confidence statistics. |
| [`lamm-mit/keratin-mech-seq-ss-md-properties`](https://huggingface.co/datasets/lamm-mit/keratin-mech-seq-ss-md-properties) | Long-form molecular-dynamics results for 51 keratins across four accelerated SMD pulling velocities (`v0`, `v1`, `v2`, `v4`), including force vectors, strength, toughness, normalized mechanical properties, sequence descriptors, secondary-structure descriptors, SASA, persistence length, and hydrogen-bond change. |

Example loading code:

```python
from datasets import load_dataset

fasta = load_dataset("lamm-mit/keratin-fasta", split="train")
pdb = load_dataset("lamm-mit/keratin-pdb", split="train")
md_props = load_dataset("lamm-mit/keratin-mech-seq-ss-md-properties", split="train")

## Citation
If you use this repository, please cite the associated paper.

```bibtex
@article{LuLeonforteBuehler2026,
    title={Comparative Molecular Dynamics Characterization of Hair Keratin Unfolding Mechanics},
    author={Wei Lu, Fabien Leonforte, Markus J. Buehler},
    journal={xxx},
    year={2026},
    url={http://},
}
```
