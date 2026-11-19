
from pyscf import gto, scf

def build(n, R):
    atoms = []

    for i in range(n):
        atoms.append(
            ("H", (0.0, 0.0, i * R))
        )

    mol = gto.M(
        atom=atoms,
        basis="sto-3g",
        unit="Bohr",
        charge=0,
        spin=0,
        verbose=4
                                                             
    )

    mf = scf.RHF(mol)
    mf.kernel()

    return mol, mf

mol, mf = build(n=4, R=1.8)

print("Converged:", mf.converged)
print("E_HF (Hartree):", mf.e_tot)
print("Number of atoms:", mol.natm)
print("Number of electrons:", mol.nelectron)

E_HF_H4_R18 = mf.e_tot

print(f"H4 RHF energy = {E_HF_H4_R18:.12f} Hartree")
                                                                                                        print(f"SCF converged = {mf.converged}")
