## CWL MPI Hello World on SLURM
This workflow demonstrates Common Workflow Language (CWL) based job execution on ACTIVATE for MPI workloads.

### Overview
This workflow runs an **MPI Hello World** program using **CWL** on a **SLURM cluster**. It:
1. Installs Intel-OneAPI MPI (if selected).
2. Installs CWLTool under Miniconda (if selected).
3. Transfers CWL workflow files to the remote cluster.
4. Executes the CWL workflow.

### Activate Workflow Steps

#### 1. Install Dependencies
- Installs MPI and CWLTool if enabled.
- Alternatively, users can provide custom load commands.

#### 2. Transfer Files
- Copies the CWL workflow files to ~/pw/jobs/<workflow-name>/<job-number>/cwl_workflow on the cluster.

#### 3. Execute CWL Workflow
- Creates a CWL input file (inputs.yaml).
- Runs cwltool to execute the workflow.

### CWL Workflow Structure
- **Compile**: Builds the MPI source file.
- **Generate SLURM Script**: Prepares the batch script.
- **Submit Job**: Submits the job to SLURM.
- **Wait for Completion**: Monitors job execution.

The output of the workflow is written to ` ~/pw/jobs/<workflow-name>/<job-number>/cwl_workflow/slurm-output/mpitest.out`:

```
Hello world from processor alvaro-gcprockyv3-00114-1-0002, rank 3 out of 4 processors
Hello world from processor alvaro-gcprockyv3-00114-1-0001, rank 1 out of 4 processors
Hello world from processor alvaro-gcprockyv3-00114-1-0002, rank 2 out of 4 processors
Hello world from processor alvaro-gcprockyv3-00114-1-0001, rank 0 out of 4 processors
```
