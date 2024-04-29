-- CreateTable
CREATE TABLE "Patient" (
    "id" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "UserType" TEXT NOT NULL DEFAULT 'Patient',
    "Contact" TEXT NOT NULL,
    "Age" INTEGER NOT NULL,
    "Address" TEXT NOT NULL,
    "Comorbidities" TEXT[],
    "AppointmentDates" TEXT[],

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hospital" (
    "HId" SERIAL NOT NULL,
    "HospitalName" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Hospital_pkey" PRIMARY KEY ("HId")
);

-- CreateTable
CREATE TABLE "Doctor" (
    "DId" SERIAL NOT NULL,
    "UserType" TEXT NOT NULL DEFAULT 'Doctor',
    "Name" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "Speciality" TEXT NOT NULL,

    CONSTRAINT "Doctor_pkey" PRIMARY KEY ("DId")
);

-- CreateTable
CREATE TABLE "DoctorsOnHospitals" (
    "id" SERIAL NOT NULL,
    "DoctorId" INTEGER NOT NULL,
    "HospitalId" INTEGER NOT NULL,

    CONSTRAINT "DoctorsOnHospitals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupportStaff" (
    "SId" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "UserType" TEXT NOT NULL DEFAULT 'Support Staff',
    "Password" TEXT NOT NULL,
    "Designation" TEXT NOT NULL,
    "HospitalId" INTEGER,

    CONSTRAINT "SupportStaff_pkey" PRIMARY KEY ("SId")
);

-- CreateTable
CREATE TABLE "Admin" (
    "AId" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Password" TEXT NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("AId")
);

-- CreateIndex
CREATE UNIQUE INDEX "DoctorsOnHospitals_DoctorId_HospitalId_key" ON "DoctorsOnHospitals"("DoctorId", "HospitalId");

-- AddForeignKey
ALTER TABLE "DoctorsOnHospitals" ADD CONSTRAINT "DoctorsOnHospitals_DoctorId_fkey" FOREIGN KEY ("DoctorId") REFERENCES "Doctor"("DId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DoctorsOnHospitals" ADD CONSTRAINT "DoctorsOnHospitals_HospitalId_fkey" FOREIGN KEY ("HospitalId") REFERENCES "Hospital"("HId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupportStaff" ADD CONSTRAINT "SupportStaff_HospitalId_fkey" FOREIGN KEY ("HospitalId") REFERENCES "Hospital"("HId") ON DELETE SET NULL ON UPDATE CASCADE;
