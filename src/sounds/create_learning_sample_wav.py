#coding:utf-8
import os
import glob
import os.path
import wave

if __name__ == "__main__":
 print("create leanning sample")

 masters = glob.glob('./masters/*.wav')
 master_num = 0
 for master in masters:

     master_num+=1
     wf = wave.open(master , "r" )
     master_wav_time = float(wf.getnframes()) / wf.getframerate()
     print "%s [s]: %3.3f" % (master, master_wav_time)

     noise_num = 0
     noises = glob.glob('./noises/*.wav')
     for noise in noises:
         noise_num+=1
         master_filename_without_ext, master_file_ext = os.path.splitext(master)
         for volume_idx in range(10):
             volume = volume_idx + 1
             # MEMO: master種別_ノイズno_ノイズボリューム
             new_file_name = "./learning_samples/" + str(master_num) + "_" + str(noise_num) + "_" + str(volume) + ".wav"
             print "create new sample: %s" % new_file_name
             os.system("sox -m " + master + " -v " + str(volume * 0.1) + " " + noise + " " + new_file_name + " trim 0 " + str(master_wav_time))

