#!/bin/bash

if [ -z ${service_parent_install_dir} ]; then
    service_parent_install_dir=${HOME}/pw/software
fi

service_conda_install_dir=${service_parent_install_dir}/miniconda3-cwltool


if [ -d "${service_conda_install_dir}" ]; then
    echo "Miniconda directory with cwltool ${service_conda_install_dir} already exists."
    echo "No additional installation is required."
    echo "To reinstall, delete the directory and rerun the job."
    exit 0
fi

echo; echo "Installing Miniconda under ${service_conda_install_dir}"
mkdir -p ${service_conda_install_dir}
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${service_conda_install_dir}/miniconda.sh
bash ${service_conda_install_dir}/miniconda.sh -b -u -p ${service_conda_install_dir}
rm ${service_conda_install_dir}/miniconda.sh
source ${service_conda_install_dir}/bin/activate
pip install cwltool 