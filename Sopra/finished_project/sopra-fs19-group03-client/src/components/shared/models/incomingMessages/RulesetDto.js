
import "../EnumsJS";

class RulesetDto {
    constructor(data = {}){
        this.userId = null;
        this.actions = null;
        this.actionType = null;
        Object.assign(this, data);
    }
}
export default RulesetDto;