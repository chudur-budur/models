# Some Notes on How to Run Experiments on Custom Data

First, this code won't work on the latest python. So you need to use python older than `<3.7.0`. In this case we are using `3.6.13`. To know how to maintain multiple python version and sandboxing installation, please see [pyenv](https://github.com/pyenv/pyenv) and [pipenv](https://github.com/pypa/pipenv). 

Then install tensorflow -- 

```shell
pip install tensorflow
```

Then the dependencies --

```shell
pip install -r official/requirements.txt
```

Next, compile and install the `object_detection` API --

```shell
cd models/research
# Compile protos.
protoc object_detection/protos/*.proto --python_out=.
# Install TensorFlow Object Detection API.
cp object_detection/packages/tf2/setup.py .
pip install --use-feature=2020-resolver .
```

```
# Test the installation.
python object_detection/builders/model_builder_tf2_test.py
```

Download the COCO2017 dataset (in this case we keep them in `/nodclouddata/mscoco/coco2017`), just download the zips and extract them. They should come up like this:

```
/nodclouddata/mscoco/coco2017
    + /train2017
    + /val2017
    + /test2017
    + /annotations 
    + /unlabeled2017
```

Fix the [`create_coco_tf_record.py`](https://github.com/chudur-budur/models/blob/master/research/object_detection/dataset_tools/create_coco_tf_record.py) file. Follow the instructions from [here](https://github.com/tensorflow/tensorflow/issues/17353#issuecomment-708624734). Now run the converter script to transform COCO dataset to TFRecords. Here we are doing the conversion on the `instances_****2017.json` --

```
cd ~/models
./coco2tfr.sh
```

It will take like 20 minutes on GCP.

Inside the `model/configs` folder there are couple of config files for different experiments. Invoke them to run. For example, to run `retinanet` with `spine-49` backbone --

```shell
./train
```

Hope this helps!!
