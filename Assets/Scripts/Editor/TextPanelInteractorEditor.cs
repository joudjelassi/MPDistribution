using UnityEditor;
using UnityEngine;

namespace Editor{

    [CustomEditor(typeof(TextPanelInteractor))]
    public class TextPanelInteractorEditor : UnityEditor.Editor
    {
        public override void OnInspectorGUI()
        {
            TextPanelInteractor textPanelInteractor = target as TextPanelInteractor;

            if (GUILayout.Button("Update Text"))
            {
                Debug.Log("Updating text, please wait...");
                textPanelInteractor.UpdateText();
            }
            if (GUILayout.Button("Add Model"))
            {
                Debug.Log("Creating model, please wait...");
                InstantiatePrefab(textPanelInteractor);
            }

            DrawDefaultInspector();
        }

        private void InstantiatePrefab(TextPanelInteractor textPanelInteractor)
        {
            if (textPanelInteractor.Model != null)
            {
                GameObject model = Instantiate(textPanelInteractor.Model, textPanelInteractor.transform.position, Quaternion.identity);

                model.transform.parent = textPanelInteractor.transform;

                model.transform.localPosition = Vector3.zero;
                model.transform.localRotation = Quaternion.identity;
                model.transform.localScale = Vector3.one;

                Undo.RegisterCreatedObjectUndo(model, "Instantiate Model");
            }
            else
            {
                Debug.LogWarning("Model is not assigned in the TextPanelInteractor script.");
            }
        }

    }
}
