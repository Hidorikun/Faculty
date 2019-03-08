using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using MPI;

namespace MPI_ImageFilter
{
    class Program
    { 
        static void Main(string[] args)
        {
            MPIController mpiController = new MPIController();

            using (new MPI.Environment(ref args))
            {
                if (Communicator.world.Rank == 0)
                {
                    //master process

                    mpiController.grayScaleMaster("../../../InputPhotos/cat-800x600.jpg", "../../../OutputPhotos/gray-cat-800x600");
                    mpiController.grayScaleMaster("../../../InputPhotos/cat-1600x1200.jpg", "../../../OutputPhotos/gray-cat-1600x1200");
                    mpiController.grayScaleMaster("../../../InputPhotos/cat-4096x2160.jpg", "../../../OutputPhotos/gray-cat-4096x2160");

                    Console.WriteLine("\n");

                    mpiController.gaussianBlurMaster("../../../InputPhotos/cat-800x600.jpg", "../../../OutputPhotos/blur-cat-800x600");
                    mpiController.gaussianBlurMaster("../../../InputPhotos/cat-1600x1200.jpg", "../../../OutputPhotos/blur-cat-1600x1200");
                    mpiController.gaussianBlurMaster("../../../InputPhotos/cat-4096x2160.jpg", "../../../OutputPhotos/blur-cat-4096x2160");
                }
                else
                {
                    //child process
                    
                    mpiController.grayScaleWorker();
                    mpiController.grayScaleWorker();
                    mpiController.grayScaleWorker();
                    
                    mpiController.gaussianBlurWorker();
                    mpiController.gaussianBlurWorker();
                    mpiController.gaussianBlurWorker();
                }
            }
        }
    }
}
