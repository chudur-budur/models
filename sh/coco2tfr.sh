PROJ_HOME="$HOME/models/research"
DATA_ROOT="/nodclouddata/mscoco"
PYTHONPATH=$PROJ_HOME python $PROJ_HOME/object_detection/dataset_tools/create_coco_tf_record.py \
   --train_image_dir=$DATA_ROOT/coco2017/train2017 \
   --val_image_dir=$DATA_ROOT/coco2017/val2017 \
   --test_image_dir=$DATA_ROOT/coco2017/test2017 \
   --train_annotations_file=$DATA_ROOT/coco2017/annotations/instances_train2017.json \
   --val_annotations_file=$DATA_ROOT/coco2017/annotations/instances_val2017.json \
   --testdev_annotations_file=$DATA_ROOT/coco2017/annotations/image_info_test-dev2017.json \
   --output_dir=$DATA_ROOT/tfr2017
