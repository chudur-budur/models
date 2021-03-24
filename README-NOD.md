# Some Notes on How to Run Experiments on Custom Data

First, you need to install tensorflow, this README assumes that you already have one.

```shell
pip3 install tensorflow
```

Then install the dependencies.

```shell
pip3 install -r official/requirements.txt
```

The `pycocotools` that comes from PyPi is buggy. So reinstall this from [here](https://github.com/chudur-budur/cocoapi).

```shell
cd ~
pip uninstall pycocotools
git clone git@github.com:chudur-budur/cocoapi.git
cd cocoapi/PythonAPI
make 
make install
```

Compile and install the `object_detection` API --

```shell
cd models/research
# Compile protos.
protoc object_detection/protos/*.proto --python_out=.
# Install TensorFlow Object Detection API.
cp object_detection/packages/tf2/setup.py .
python -m pip install --use-feature=2020-resolver .
```

```
# Test the installation.
python object_detection/builders/model_builder_tf2_test.py
```

Download the COCO2017 dataset (in this case we keep them in `~/cocodataset`), just download the zips and extract them. They should come up like this:

```
~/cocodatasets
    /train2017
    /val2017
    /test2017
    /annotations 
    /unlabeled2017
```

Fix the `research/object_detection/dataset_tools/create_coco_tf_record.py` file. Follow the instruction in [`https://github.com/tensorflow/tensorflow/issues/17353#issuecomment-708624734`](https://github.com/tensorflow/tensorflow/issues/17353#issuecomment-708624734). Now run the converter script to transform COCO dataset to TFRecords. Here we are doing the conversion on the `instances_*2017.json` --

```
cd ~/models
./coco2tfr.sh
```

It will take like 20 minutes on GCP.

Inside the `model/configs` folder there are couple of config files for different experiments. Invoke them to run. For example, to run `retinanet` --

```shell
./train retinanet
```
