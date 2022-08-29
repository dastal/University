
import "../EnumsJS";


class SetupDto {
    constructor(data = {}){
        this.chooserId = null;
        this.currentChooser = null;
        this.godCards = null;
        this.selectedGodCards = null;
        Object.assign(this, data);
    }
}
export default SetupDto