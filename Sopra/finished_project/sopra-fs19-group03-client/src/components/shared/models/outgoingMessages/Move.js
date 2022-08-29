
import "../EnumsJS";



class Move {
    constructor(row, column, type, skip) {
        this.row = row;
        this.column = column;
        this.type = type;
        this.skip = skip;
    }
    getRow(){return this.row;}
    getColumn(){return this.column;}
    getType(){return this.type;}
    getSkip() {return this.skip;}
    setRow(row){this.row = row;}
    setColumn(column){this.column = column;}
    setType(type){this.type = type;}
    setSkip(skip){this.skip = skip;}
}

export default Move;