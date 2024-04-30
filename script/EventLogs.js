const hh = require("hardhat")

const main = async () => {
    await hh.run("compile")

    const sf = await hh.ethers.getContractFactory("SourceFund")
    const sourcefund = await sf.deploy()
    await sourcefund.deploy()
}

main().catch((error) => {
    console.error(error)
    precess.exitCode = 1;
})