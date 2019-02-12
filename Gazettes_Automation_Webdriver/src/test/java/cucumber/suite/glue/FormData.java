package cucumber.suite.glue;

public class FormData {

    private String fieldName;
    private String fieldValue;
    private FieldType fieldType;

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFieldValue() {
        return fieldValue;
    }

    public void setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue;
    }

    public FieldType getFieldType() {
        return fieldType;
    }

    public void setFieldType(FieldType fieldType) {
        this.fieldType = fieldType;
    }

    enum FieldType {
        TEXT("text"), DATE("date"), SELECT("select"), EMAIL("email");

        private String type;

        FieldType(String type) {
            this.setType(type);
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

    }
}
