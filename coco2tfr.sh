PROJ_HOME="$HOME/models/research"
DATA_ROOT="/nodclouddata/mscoco/coco2014"
PYTHONPATH=$PROJ_HOME python3 $PROJ_HOME/object_detection/dataset_tools/create_coco_tf_record.py \
   --train_image_dir=$DATA_ROOT/train2014 \
   --val_image_dir=$DATA_ROOT/val2014 \
   --test_image_dir=$DATA_ROOT/test2014 \
   --train_annotations_file=$DATA_ROOT/annotations/instances_train2014.json \
   --val_annotations_file=$DATA_ROOT/annotations/instances_val2014.json \
   --testdev_annotations_file=$DATA_ROOT/annotations/image_info_test2014.json \
   --output_dir=$DATA_ROOT/tfr2014
